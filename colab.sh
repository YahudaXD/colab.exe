#! /bin/bash
printf "・Installing Colab.exe Please wait" >&2
{
sudo useradd -m colab-exe
sudo adduser colab-exe sudo
echo 'colaab-exe:8426' | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
sudo apt-get update
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo DEBIAN_FRONTEND=noninteractive \
apt install --assume-yes xfce4 desktop-base
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'  
sudo apt install --assume-yes xscreensaver
sudo systemctl disable lightdm.service
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg --install google-chrome-stable_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo apt install nautilus nano -y 
sudo adduser colab-exe chrome-remote-desktop
sudo apt-get install wine-stable
sudo apt-get install wine
sudo dpkg --print-foreign-architectures
sudo dpkg --add-architecture i386
sudo dpkg --print-foreign-architectures
sudo wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
sudo apt install --install-recommends winehq-stable
sudo apt install wine32
} &> /dev/null &&
printf "\nReady to use " >&2 ||
printf "\nError Occured " >&2
printf '\nPlease go to https://remotedesktop.google.com/headless and paste the AUTH code in the Debian/Linux section to connect.  Copy Command Of Debian Linux And Paste Down\n'
read -p "AUTH Code: " CRP
su - colab-exe -c """$CRP"""
printf 'Check https://remotedesktop.google.com/access/ \n\n'
if sudo apt-get upgrade &> /dev/null
then
    printf "\n\nColab.exe Developed by Yahuda " >&2
else
    printf "\n\nError Occured " >&2
fi
