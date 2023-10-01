# my-linux-utils-setup
Useful packages and instructions when setting up linux

# Packages
breeze-gtk

breeze-plymouth

dolphin-plugins

xdg-desktop-portal-kde

gamemode

lib32-gamemode

mangohud

lib32-mangohud

goverlay

vlc

haruna

heroic-games-launcher-bin

kate

knotes

kolourpaint

pinta

kio-gdrive

libunity

lutris

noto-fonts

noto-fonts-emoji-apple

noto-fonts-extra

ttf-ms-fonts

onlyoffice-bin

peazip (para descomprimir, a veces ark se me ha quejado)

plasma-browser-integration

winetricks

protontricks

protonup

steam (runtime, no native)

remmina (para el remote desktop)

spectacle (screenshots, seguramente esté ya instalado)

gpu-screen-recorder-gtk

xpadneo (si tienes mando de xbox one, si tienes de 360 usa xboxdrv-stable-git si tienes genérico puede que funcione sin más o con este último)

peek (make gifs from screen)

# Packages for wayland
plasma-wayland-session

wayland

wayland-utils

qt5-wayland

qt6-wayland

pipewire

pipewire-jack

pipewire-pulse

pipewire-alsa

pipewire-v4l2

wireplumber

kwayland-integration

lib32-pipewire

lib32-pipewire-jack

lib32-pipewire-v4l2

If on Nvidia, make sure drm.mode.set is configured (should be automatic if propietary nvidia driver installed):
`
Add the kernel-parameter

open the /etc/default/grub-file, like this: sudo nano /etc/default/grub and find the following: GRUB_CMDLINE_LINUX_DEFAULT=. There should already be some parameters, but you should add one: nvidia-drm.modeset=1. For me, the line looks like this:

GRUB_CMDLINE_LINUX_DEFAULT="quiet udev.log_priority=3 nvidia-drm.modeset=1"

    Note: It doesn't have to look the same for you.

After that, run "sudo update-grub" to update grub. Now you should reboot.`
Then you should see a new login option (wayland) on your login screen (set login manager to remember last used, Log off, log in again in wayland)

# VPN things
dhcpcd (endevour/arch, comes already with Manjaro)

then (no need on Manjaro at least):
`systemctl status systemd-resolved.service`

`systemctl enable systemd-resolved.service`

netns-exec (user space netns for vpn work)

# Better fonts
On /etc/environment
`FREETYPE_PROPERTIES="cff:no-stem-darkening=0 autofitter:no-stem-darkening=0"`

# Electron apps
Flag for using wayland + middle click scroll
`--enable-features=UseOzonePlatform --ozone-platform=wayland --enable-blink-features=MiddleClickAutoscroll`

# Flags and envs for chromium and firefox
Flags útiles chromium:

`--use-gl=desktop --enable-features=VaapiVideoDecoder,VaapiVideoEncoder,CanvasOopRasterization --disable-features=UseChromeOSDirectVideoDecoder,UseOzonePlatform --ignore-gpu-blocklist --disable-gpu-driver-bug-workarounds --enable-gpu-rasterization --canvas-oop-rasterization --enable-zero-copy %U`
env útiles Firefox:

MOZ_ENABLE_WAYLAND=1 (should be on /etc/enviroment)

# Nvidia hardware decode acceleration
https://github.com/elFarto/nvidia-vaapi-driver

# Wayland workarrounds
Jellyfin media player (flatpak o jellyfin-media-player) con flag: --disable-gpu

# Recommended Flatpaks (Installed via "Discovery")
Plex

Jellyfin Media Player

# My hardware
polycrhomatic, open razer

it87-dkms-git (sensores placa)

zenpower3-dkms

https://codeberg.org/rtcqs/rtcqs para ver que el realtime y el audio tal esten en su sitio

Discord

OBS

Zoom
