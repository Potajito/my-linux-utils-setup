# my-linux-utils-setup
Useful packages and instructions when setting up linux

# Packages
breeze-gtkv
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

# VPN things
dhcpcd (endevour/arch, comes already with Manjaro)
then (no need on Manjaro at least):
`systemctl status systemd-resolved.service
systemctl enable systemd-resolved.service`
netns-exec (user space netns for vpn work)
