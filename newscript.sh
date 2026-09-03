#!/data/data/com.termux/files/usr/bin/bash
#
# FRESH TERMUX 1.0 - a pre-configured, user-friendly Termux setup
# Script by cyb0rgdoll  -  https://github.com/cyb0rgdoll/freshtermux

# tput lives in ncurses-utils, so install it first (needed for the colours below)
pkg install ncurses-utils -y && clear

# colours / status tag
black=$(tput setaf 0)
blue=$(tput setaf 4)
reset=$(tput sgr0)
INFO="${blue}[*]${reset}"

touch ~/.hushlogin
pkg update -y && pkg upgrade -y
clear

echo "${blue}Welcome and enjoy the script as it runs${reset}"
echo "in case the script fails and you are not seeing the ZSH shell then restart the script"
sleep 5
clear

pkg install figlet -y
clear
figlet -c Welcome to FRESH TERMUX 1.0
echo "${black}                  Upgraded ${reset}"
sleep 5

echo "${blue} Requesting access to storage .. ${reset}"
termux-setup-storage
echo
echo

# extra package repositories
pkg install unstable-repo -y
pkg install x11-repo -y
pkg install root-repo -y
clear

echo "${INFO} Installing common tools ..."
pkg install -y \
    nmap nano python wget nodejs curl ruby openssh proot git tsu \
    tmux tree htop lolcat vim neofetch termux-services make golang
clear

echo "${blue} Installing root/sudo to your terminal ${reset}"
git clone https://github.com/Towha/termux-sudo
cd termux-sudo || exit 1
cat sudo > /data/data/com.termux/files/usr/bin/sudo
chmod 700 /data/data/com.termux/files/usr/bin/sudo
cd
echo "${blue}Good.. we have progressed, to use sudo you actually require a ROOT device ${reset}"
sleep 3
clear

echo "${blue}Creating extra buttons for your terminal${reset}"
mkdir -p ~/.termux && echo "extra-keys = [['ESC','/','-','HOME','UP','END','PGUP','DEL'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN','BKSP']]" > ~/.termux/termux.properties
termux-reload-settings
sleep 3
clear

rm -rf termux-sudo
clear

figlet -c Now making shell pretty.. | lolcat -p 100 -a
pkg install -y zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh) --unattended" > /dev/null

echo "${INFO} Making Oh My Zsh so much BETTER..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-completions "$HOME/.oh-my-zsh/custom/plugins/zsh-completions"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"

[[ -z $(grep "autoload -U compinit && compinit" "$HOME/.zshrc") ]] && echo "autoload -U compinit && compinit" >> "$HOME/.zshrc"
sed -i '/^ZSH_THEME=/c\ZSH_THEME="powerlevel10k/powerlevel10k"' "$HOME/.zshrc"

if [ "$(uname -o)" != Android ]; then
    sed -i '/^plugins=/c\plugins=(git sudo z command-not-found zsh-syntax-highlighting zsh-autosuggestions zsh-completions)' "$HOME/.zshrc"
else
    sed -i '/^plugins=/c\plugins=(git z zsh-syntax-highlighting zsh-autosuggestions zsh-completions)' "$HOME/.zshrc"
fi

[ "$(uname -o)" != Android ] && chsh -s "$(which zsh)" || chsh -s zsh

echo "${INFO} Oh My Zsh is loaded now! Script by cyb0rgdoll, enjoy :)"
exec zsh
