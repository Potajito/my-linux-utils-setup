#!/bin/bash

# Get the name of the TV monitor
#ultrawide_monitor=$(kscreen-doctor --outputs | grep "DP-1" | awk '{print $1}')

# Set the TV monitor as the primary monitor
kscreen-doctor output.HDMI-A-2.disable output.DP-2.enable output.DP-2.primary output.DP-2.position.0,0 output.DP-1.position.3440,180 output.DP-2.primary
# pactl set-default-sink alsa_output.pci-0000_0a_00.4.analog-stereo
pactl set-default-sink "Echo Cancellation Sink"
