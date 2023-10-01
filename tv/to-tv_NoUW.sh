#!/bin/bash

# Get the name of the TV monitor
tv_monitor=$(kscreen-doctor --outputs | grep -o "HDMI-[A-Z]-[0-9]\+" | awk '{print $1}')

# Enable the TV monitor, disable UW, Set TV as primary
kscreen-doctor output.HDMI-A-2.enable output.HDMI-A-2.primary output.DP-2.disable output.HDMI-A-2.position.0,0 output.DP-1.position.3840,0
# Disable UW
# kscreen-doctor output.DP-2.disable
# turn off UW
sleep 5
hdmi_audio_sink=$(pactl list sinks | grep -A1 "node.name" | grep "hdmi-" | awk -F'=' '{print $2}' | cut -d'"' -f2)
#device_description=$(pactl list sinks | grep -A1 "device.product.name" | awk -F'=' '{print $2}' | cut -d'"' -f2) #not used, but it would be nice to have it grab the device to then use it on the wpctl command
if [ -n "$hdmi_audio_sink" ]; then
    # Set the HDMI audio output as the default sink
    pactl set-default-sink "$hdmi_audio_sink"
    pactl_output=$(pactl --format=json list cards)

    object_id=$(echo "$pactl_output" | jq -r '.[] | select(.properties."device.nick" == "HDA NVidia") | .properties."object.serial"')
    echo "TV device number: $object_id"

    profile_name=$(echo "$pactl_output" | jq -r 'first(.[] | select(.properties."device.nick" == "HDA NVidia") | .profiles | to_entries[] | select(.key | startswith("output:hdmi-surround-"))).key')

    echo "TV profile name: $profile_name"

    pactl set-card-profile "$object_id" "$profile_name" #set the profile to 5, which is 5.1 (the order on the list of pavucontrol, for example, 0 is off, 1, 2...)
    hdmi_audio_sink=$(pactl list sinks | grep -A1 "node.name" | grep "hdmi-surround" | awk -F'=' '{print $2}' | cut -d'"' -f2)
    pactl set-default-sink "$hdmi_audio_sink"
    echo "Default sink set to: $hdmi_audio_sink using profile $profile_name"
else
    echo "HDMI audio sink not found for monitor: $tv_monitor"
fi

