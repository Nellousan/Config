declare -A osInfo;
osInfo[/etc/redhat-release]=yum
osInfo[/etc/arch-release]=pacman
osInfo[/etc/gentoo-release]=emerge
osInfo[/etc/SuSE-release]=zypp
osInfo[/etc/debian_version]=apt-get

declare pckgman;

for f in ${!osInfo[@]}
do
    if [[ -f $f ]];then
        pckgman=${osInfo[$f]}
    fi
done

${pckgman} install -y code
${pckgman} install -y emacs
${pckgman} install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sh -c "$(curl -fsSL https://get.docker.com)"
${pckgman} install -y gimp
${pckgman} install -y htop

${pckgman} install -y i3
${pckgman} install -y i3blocks
${pckgman} install -y lightdm
${pckgman} install -y lightdm-webkit2-greeter

cp -r etc/* /etc/
cp -r usr/* /usr/
cp -r .config ~/
cp -r .themes ~/
cp .gitconfig ~/
cp .zshrc ~/

${pckgman} install -y snapd

snapd install -y spotify
snapd install -y discord
snapd install -y teams

systemctl enable lightdm