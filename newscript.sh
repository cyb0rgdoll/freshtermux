#!//data/com.termux/files/usr/bin/bash
current_dir=$(pwd)
pkg install ncurses-utils && clear 
#vars
black=`tput setaf p`
blue=`tput setaf 4`
reset=`tput sgr0`
touch ~/.hushlogin
apt update && apt upgrade -y
clear
echo "${blue}Welcome and enjoy the script as it runs${reset}"
echo "in case the script fails and you are not seeing the ZSH shell then restart the script"
sleep 5
clear
apt install figlet -y
gem install lolcat
clear 
figlet -c Welcome to fresh TERMUX 
echo "${black}                  Upgraded ${return}"
sleep 5
echo "${blue} Requesting access to storage .. ${reset}"
termux-setup-storage
echo
echo
pkg install unstable-repo
pkg install x11-repo
pkg install root-repo
clear 
apt install nmap -y
apt install nano -y
apt install python -y
apt install wget -y
apt install nodejs -y
apt install curl -y
apt install ruby -y
apt install openssh -y
apt install proot -y
apt install git -y
apt install tsu -y
apt install tmux -y
apt install tree -y
apt install htop -y
apt install lolcat -y
apt install vim -y
apt install neofetch -y
pkg install termux-services -y
pkg install make -y
pkg install golang -y
echo "${blue} Installing root/sudo to your terminal ${reset}"
clear
git clone https://github.com/Towha/termux-sudo 
cd termux-sudo
pkg install ncurses-utils
cat sudo > /data/data/com.termux/files/usr/bin/sudo
chmod 700 /data/data/com.termux/files/usr/bin/sudo
cd
echo "${blue}Good.. we have progressed, to use sudo you actually require ROOT device ${reset}"
sleep 3
clear
#!//data/com.termux/files/usr/bin/bash
apt update
clear
sleep 2
echo "${blue}Creating extra buttons for your terminal${reset}"
mkdir -p ~/.termux && echo "extra-keys = [['ESC','/','-','HOME','UP','END','PGUP','DEL'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN','BKSP']]" > ~/.termux/termux.properties
termux-reload-settings
#echo "${red}Please now exit and restart termux for better performance after script has been done${reset}"
sleep 3
clear
rm -rf termux-sudo termux.sh
clear
figlet -c Now making shell pretty.. | lolcat -p 100 -a
pkg i -y zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh) --unattended" > /dev/null
chsh -s zsh
echo -e "${INFO} Making Oh My Zsh so much BETTER..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-completions $HOME/.oh-my-zsh/custom/plugins/zsh-completions
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
    [[ -z $(grep "autoload -U compinit && compinit" $HOME/.zshrc) ]] && echo "autoload -U compinit && compinit" >> $HOME/.zshrc
    sed -i '/^ZSH_THEME=/c\ZSH_THEME="powerlevel10k/powerlevel10k"' $HOME/.zshrc
    if [ $(uname -o) != Android ]; then
        sed -i '/^plugins=/c\plugins=(git sudo z command-not-found zsh-syntax-highlighting zsh-autosuggestions zsh-completions)' $HOME/.zshrc
    else
        sed -i '/^plugins=/c\plugins=(git z zsh-syntax-highlighting zsh-autosuggestions zsh-completions)' $HOME/.zshrc
    fi
    [ $(uname -o) != Android ] && chsh -s $(which zsh) || chsh -s zsh
    [ $? == 0 ] && echo -e "${INFO} Oh My Zsh is loaded now！Script by cyb0rgdoll, enjoy.
    zsh
exit
sleep 3
clear
figlet And lastly it is complete 
sleep 5
clear
