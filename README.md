# my-linux-utils-setup
Useful packages and instructions when setting up linux

# Packages
dolphin-plugins

xdg-desktop-portal-gnome (fuentes no mierdas en flatpaks)

xdg-desktop-portal-gtk

xdg-desktop-portal-kde (de los portales, instalar este por ultimo)

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

xpadneo (si tienes mando de xbox one, si tienes de 360 usa xpad-dkms-git si tienes genérico puede que funcione sin más o con este último)


Wine:
sudo pacman -S --needed wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls \
mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error \
lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo \
sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama \
ncurses lib32-ncurses ocl-icd lib32-ocl-icd libxslt lib32-libxslt libva lib32-libva gtk3 \
lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader

drivers :

NVIDIA: sudo pacman -S --needed nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader

AMD: sudo pacman -S --needed lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader

# Packages for wayland

qt6-imageformats

qt5-imageformats

qt5-wayland

qt6-wayland

pipewire-v4l2

v4l2loopback-dkms (para la cámara virtual del obs)

kwayland-integration

lib32-pipewire

lib32-pipewire-jack

lib32-pipewire-v4l2

(Esto es ya automatico todo, lo dejo por referencia si algo usa grub)

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

# Nvidia hardware decode acceleration (diría que ya no hace falta, yo no lo tengo ya vamos)
https://github.com/elFarto/nvidia-vaapi-driver

# Wayland workarrounds
Jellyfin media player (flatpak o jellyfin-media-player) con flag: --disable-gpu

# Recommended Flatpaks (Installed via "Discovery")
Plex


gpu-screen-recorder

Jellyfin Media Player

Vesktop

OBS

Zoom

# My hardware
polycrhomatic, open razer

https://codeberg.org/rtcqs/rtcqs para ver que el realtime y el audio tal esten en su sitio

# Fonts

Pero mejor:
en /home/user/.config/fontconfig/ lo que está en: https://github.com/Potajito/my-linux-utils-setup/tree/main/fontconfig

en Kde settings-Fonts: Noto Sanas 12, Antialias check, subpixel RGB, Hinting Medium

On /etc/environment FREETYPE_PROPERTIES="cff:no-stem-darkening=0 autofitter:no-stem-darkening=0"

adobe-base-14-fonts
cantarell-fonts
gnu-free-fonts
noto-fonts
noto-fonts-emoji
noto-fonts-extra
ttf-ms-fonts
ttf-google

Change font in vencord, in css settings:
::placeholder, body, button, input, select, textarea {
    font-family: "Noto Sans";
    text-rendering: optimizeLegibility;
}


Alternativa:
https://gist.github.com/YoEight/d19112db56cd8f93835bf2d009d617f7

https://gist.github.com/charveey/091b11ea554436d15c7fffcf01129a8a
