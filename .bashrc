#!/usr/bin/bash
### EXPORT ###
export EDITOR='nvim'
export VISUAL='nvim'
export HISTCONTROL=ignoreboth:erasedups
export PAGER='most'

#Ibus settings if you need them
#type ibus-setup in terminal to change settings and start the daemon
#delete the hashtags of the next lines and restart
#export GTK_IM_MODULE=ibus
#export XMODIFIERS=@im=dbus
#export QT_IM_MODULE=ibus

PS1='[\u@\h \W]\$ '

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -d "$HOME/.bin" ]; then
	PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

### TEMP STUFF TO ADD TO MY BASH CONFIG FILES ###
export FZF_DEFAULT_COMMAND="fd"
export RANGER_LOAD_DEFAULT_RC=FALSE

### ALIASES - TEMP ###
# Blur {{{
if [[ $(ps --no-header -p $PPID -o comm) =~ yakuake|kitty ]]; then
	for wid in $(xdotool search --pid $PPID); do
		xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid
	done
fi
# }}}

#starship
eval "$(starship init bash)"

#manpager
# export MANPAGER="nvim -c 'set ft=man' -"

#myshellscripts
export PATH="$HOME/Documents/useful_command_info:$PATH"
alias favcs='favorite_colorscripts.sh'

export PATH="$HOME/Documents/my_fun_term_scripts:$PATH"
alias cclr='clear_colorscript.sh'

#colorscript
alias cs='colorscript -e'
alias colors='colorscript -e 18'

#pfetch config
export PF_COL3="3"

#searching
alias nfd='sudo find / -name'

#root stuff
alias ru='sudo su'

#config directories
#   terminal - old
# alias conf='cd $HOME/.config/'
# alias nvimconf='cd $HOME/.config/nvim/lua/custom/'
# alias awesomeconf='cd $HOME/.config/awesome/'
# alias bpytopconf='cd $HOME/.config/bpytop/'
# alias kittyconf='cd $HOME/.config/kitty/'
# alias polybarconf='cd $HOME/.config/polybar/'
# alias roficonf='cd $HOME/.config/rofi/'
# alias yadmconf='cd $HOME/.config/yadm/'
# alias rangerconf='cd $HOME/.config/ranger/'
alias conf='cd $HOME/.config/'
alias nvimconf='cd $HOME/.config/nvim/lua/custom/'
alias awesomeconf='cd $HOME/.config/awesome/'
alias bpytopconf='cd $HOME/.config/bpytop/'
alias kittyconf='cd $HOME/.config/kitty/'
alias polybarconf='cd $HOME/.config/polybar/'
alias roficonf='cd $HOME/.config/rofi/'
alias yadmconf='cd $HOME/.config/yadm/'
alias rangerconf='cd $HOME/.config/ranger/'

#common dirs
# alias trash='cd $HOME/.local/share/Trash/files/ && clear && lsa'
alias trash='ranger $HOME/.local/share/Trash/files/'

#yadm stuff
alias yadmrepo='cd $HOME/.local/share/yadm/repo.git/'
alias ya='yadm add'
alias yau='yadm add -u'
alias yaa='yadm add -A'
alias yc='yadm commit'
alias yp='yadm push'
alias ys='yadm status'
alias ylg='lazygit --use-config-file "$HOME/.config/yadm/lazygit.yml,$HOME/.config/lazygit/config.yml" --work-tree ~ --git-dir ~/.local/share/yadm/repo.git'

#kitten aliases
alias viewimg='kitty +kitten icat'

#bat aliases
alias man='batman'
alias cat='bat'

#list
#alias ls='ls --color=auto'
#alias la='ls -a'
#alias ll='ls -alFh'
#alias l='ls'
#alias l.="ls -A | egrep '^\.'"
#alias listdir="ls -d */ > list"
alias ls='exa --group-directories-first --icons'
alias lsa='exa -a --group-directories-first --icons'
alias ll='exa -lh --group-directories-first --grid --no-filesize --icons'
alias lla='exa -lha --group-directories-first --grid --no-filesize --icons'
alias lst='exa -T -L=2 --icons'
alias lsr='exa -R -L=2 --icons'
alias rll='exa -lh --group-directories-first'
alias rlla='exa -lha --group-directories-first'

#clear
alias c='clear && colorscript -e 49'
alias cr='clear && cclr'
alias cval='clear && colorscript -e 7'
alias ccoltest='clear && colorscript -e 53'
alias cc='clear'
alias cca='clear &&'
alias ccda='clear && pwd &&'
alias ca='c && echo -e "\n------------------------------------------\n" &&'

#utility
alias scr='xdpyinfo | grep dimensions'

#package managers
alias pss='pacman -Ss' #search pacman
alias yss='yay -Ss' #seach yay


#nvim
alias vim='nvim'
alias vi='nvim'
alias neovim='nvim'
alias nv='nvim'

#source bashrc
alias sb='source ~/.bashrc'
alias sbc='source ~/.bashrc && clear'

#pacman
alias sps='sudo pacman -S'
alias spr='sudo pacman -R'
alias sprs='sudo pacman -Rs'
alias sprdd='sudo pacman -Rdd'
alias spqo='sudo pacman -Qo'
alias spsii='sudo pacman -Sii'

# show the list of packages that need this package - depends mpv as example
function_depends() {
	search=$(echo "$1")
	sudo pacman -Sii $search | grep "Required" | sed -e "s/Required By     : //g" | sed -e "s/  /\n/g"
}

alias depends='function_depends'

#fix obvious typo's
alias cd..='cd ..'
alias pdw='pwd'
alias udpate='sudo pacman -Syyu'
alias upate='sudo pacman -Syyu'
alias updte='sudo pacman -Syyu'
alias updqte='sudo pacman -Syyu'
alias upqll='paru -Syu --noconfirm'
alias upal='paru -Syu --noconfirm'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#readable output
alias df='df -h'

#keyboard
alias give-me-azerty-be="sudo localectl set-x11-keymap be"
alias give-me-qwerty-us="sudo localectl set-x11-keymap us"

#setlocale
alias setlocale="sudo localectl set-locale LANG=en_US.UTF-8"
alias setlocales="sudo localectl set-x11-keymap be && sudo localectl set-locale LANG=en_US.UTF-8"

#pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"

#arcolinux logout unlock
alias rmlogoutlock="sudo rm /tmp/arcologout.lock"

#which graphical card is working
alias whichvga="/usr/local/bin/arcolinux-which-vga"

#free
alias free="free -mt"

#continue download
alias wget="wget -c"

#userlist
alias userlist="cut -d: -f1 /etc/passwd | sort"

#merge new settings
alias merge="xrdb -merge ~/.Xresources"

# Aliases for software managment
# pacman or pm
alias pacman='sudo pacman --color auto'
alias update='sudo pacman -Syyu'
alias upd='sudo pacman -Syyu'

# paru as aur helper - updates everything
alias pksyua="paru -Syu --noconfirm"
alias upall="paru -Syu --noconfirm"
alias upa="paru -Syu --noconfirm"

#ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
#grub issue 08/2022
alias install-grub-efi="sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi"

#add new fonts
alias update-fc='sudo fc-cache -fv'

#copy/paste all content of /etc/skel over to home folder - backup of config created - beware
#skel alias has been replaced with a script at /usr/local/bin/skel

#backup contents of /etc/skel to hidden backup folder in home/user
alias bupskel='cp -Rf /etc/skel ~/.skel-backup-$(date +%Y.%m.%d-%H.%M.%S)'

#copy shell configs
alias cb='cp /etc/skel/.bashrc ~/.bashrc && exec bash'
alias cz='cp /etc/skel/.zshrc ~/.zshrc && echo "Copied."'
alias cf='cp /etc/skel/.config/fish/config.fish ~/.config/fish/config.fish && echo "Copied."'

#switch between bash and zsh
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

#switch between lightdm and sddm
alias tolightdm="sudo pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings --noconfirm --needed ; sudo systemctl enable lightdm.service -f ; echo 'Lightm is active - reboot now'"
alias tosddm="sudo pacman -S sddm --noconfirm --needed ; sudo systemctl enable sddm.service -f ; echo 'Sddm is active - reboot now'"
alias toly="sudo pacman -S ly --noconfirm --needed ; sudo systemctl enable ly.service -f ; echo 'Ly is active - reboot now'"
alias togdm="sudo pacman -S gdm --noconfirm --needed ; sudo systemctl enable gdm.service -f ; echo 'Gdm is active - reboot now'"
alias tolxdm="sudo pacman -S lxdm --noconfirm --needed ; sudo systemctl enable lxdm.service -f ; echo 'Lxdm is active - reboot now'"

# kill commands
# quickly kill conkies
alias kc='killall conky'
# quickly kill polybar
alias kp='killall polybar'
# quickly kill picom
alias kpi='killall picom'

#hardware info --short
alias hw="hwinfo --short"

#audio check pulseaudio or pipewire
alias audio="pactl info | grep 'Server Name'"

#skip integrity check
alias paruskip='paru -S --mflags --skipinteg'
alias yayskip='yay -S --mflags --skipinteg'
alias trizenskip='trizen -S --skipinteg'

#check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

#check cpu
alias cpu="cpuid -i | grep uarch | head -n 1"

#get fastest mirrors in your neighborhood
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 30 --number 10 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 30 --number 10 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 30 --number 10 --sort age --save /etc/pacman.d/mirrorlist"
#our experimental - best option for the moment
alias mirrorx="sudo reflector --age 6 --latest 20  --fastest 20 --threads 5 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias mirrorxx="sudo reflector --age 6 --latest 20  --fastest 20 --threads 20 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias ram='rate-mirrors --allow-root --disable-comments arch | sudo tee /etc/pacman.d/mirrorlist'
alias rams='rate-mirrors --allow-root --disable-comments --protocol https arch  | sudo tee /etc/pacman.d/mirrorlist'

#mounting the folder Public for exchange between host and guest on virtualbox
alias vbm="sudo /usr/local/bin/arcolinux-vbox-share"

#enabling vmware services
alias start-vmware="sudo systemctl enable --now vmtoolsd.service"
alias vmware-start="sudo systemctl enable --now vmtoolsd.service"
alias sv="sudo systemctl enable --now vmtoolsd.service"

#shopt
shopt -s autocd  # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend     # do not overwrite history
shopt -s expand_aliases # expand aliases

#youtube download
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

#iso and version used to install ArcoLinux
alias iso="cat /etc/dev-rel | awk -F '=' '/ISO/ {print $2}'"
alias isoo="cat /etc/dev-rel"

#Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

# This will generate a list of explicitly installed packages
alias list="sudo pacman -Qqe"
#This will generate a list of explicitly installed packages without dependencies
alias listt="sudo pacman -Qqet"
# list of AUR packages
alias listaur="sudo pacman -Qqem"
# add > list at the end to write to a file

# install packages from list
# pacman -S --needed - < my-list-of-packages.txt

#clear
alias clean="clear; seq 1 $(tput cols) | sort -R | sparklines | lolcat"

#search content with ripgrep
alias rg="rg --sort path"

#get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#nvim for important configuration files
#know what you do in these files
alias nvlxdm="sudo $EDITOR /etc/lxdm/lxdm.conf"
alias nvlightdm="sudo $EDITOR /etc/lightdm/lightdm.conf"
alias nvpacman="sudo $EDITOR /etc/pacman.conf"
alias nvgrub="sudo $EDITOR /etc/default/grub"
alias nvconfgrub="sudo $EDITOR /boot/grub/grub.cfg"
alias nvmkinitcpio="sudo $EDITOR /etc/mkinitcpio.conf"
alias nvmirrorlist="sudo $EDITOR /etc/pacman.d/mirrorlist"
alias nvarcomirrorlist="sudo $EDITOR /etc/pacman.d/arcolinux-mirrorlist"
alias nvsddm="sudo $EDITOR /etc/sddm.conf"
alias nvsddmk="sudo $EDITOR /etc/sddm.conf.d/kde_settings.conf"
alias nvfstab="sudo $EDITOR /etc/fstab"
alias nvnsswitch="sudo $EDITOR /etc/nsswitch.conf"
alias nvsamba="sudo $EDITOR /etc/samba/smb.conf"
alias nvgnupgconf="sudo $EDITOR /etc/pacman.d/gnupg/gpg.conf"
alias nvhosts="sudo $EDITOR /etc/hosts"
alias nvhostname="sudo $EDITOR /etc/hostname"
alias nvresolv="sudo $EDITOR /etc/resolv.conf"
alias nvb="$EDITOR ~/.bashrc"
alias nvz="$EDITOR ~/.zshrc"
alias nvf="$EDITOR ~/.config/fish/config.fish"
alias nvneofetch="$EDITOR ~/.config/neofetch/config.conf"

#reading logs with bat
alias lcalamares="bat /var/log/Calamares.log"
alias lpacman="bat /var/log/pacman.log"
alias lxorg="bat /var/log/Xorg.0.log"
alias lxorgo="bat /var/log/Xorg.0.log.old"

#gpg
#verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
alias fix-gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
#receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-keyserver="[ -d ~/.gnupg ] || mkdir ~/.gnupg ; cp /etc/pacman.d/gnupg/gpg.conf ~/.gnupg/ ; echo 'done'"

#fixes
alias fix-permissions="sudo chown -R $USER:$USER ~/.config ~/.local"
alias keyfix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias key-fix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias keys-fix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fixkey="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fixkeys="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fix-key="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fix-keys="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
#fix-sddm-config is no longer an alias but an application - part of ATT
#alias fix-sddm-config="/usr/local/bin/arcolinux-fix-sddm-config"
alias fix-pacman-conf="/usr/local/bin/arcolinux-fix-pacman-conf"
alias fix-pacman-keyserver="/usr/local/bin/arcolinux-fix-pacman-gpg-conf"
alias fix-grub="/usr/local/bin/arcolinux-fix-grub"
alias fixgrub="/usr/local/bin/arcolinux-fix-grub"

#maintenance
alias big="expac -H M '%m\t%n' | sort -h | nl"
alias downgrada="sudo downgrade --ala-url https://ant.seedhost.eu/arcolinux/"

#hblock (stop tracking with hblock)
#use unhblock to stop using hblock
alias unhblock="hblock -S none -D none"

#systeminfo
alias probe="sudo -E hw-probe -all -upload"
alias sysfailed="systemctl list-units --failed"

#shutdown or reboot
alias ssn="sudo shutdown now"
alias sr="reboot"

#update betterlockscreen images
alias bls="betterlockscreen -u /usr/share/backgrounds/arcolinux/"

#give the list of all installed desktops - xsessions desktops
alias xd="ls /usr/share/xsessions"
alias xdw="ls /usr/share/wayland-sessions"

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex() {
	if [ -f $1 ]; then
		case $1 in
		*.tar.bz2) tar xjf $1 ;;
		*.tar.gz) tar xzf $1 ;;
		*.bz2) bunzip2 $1 ;;
		*.rar) unrar x $1 ;;
		*.gz) gunzip $1 ;;
		*.tar) tar xf $1 ;;
		*.tbz2) tar xjf $1 ;;
		*.tgz) tar xzf $1 ;;
		*.zip) unzip $1 ;;
		*.Z) uncompress $1 ;;
		*.7z) 7z x $1 ;;
		*.deb) ar x $1 ;;
		*.tar.xz) tar xf $1 ;;
		*.tar.zst) tar xf $1 ;;
		*) echo "'$1' cannot be extracted via ex()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

#wayland aliases
alias wsimplescreen="wf-recorder -a"
alias wsimplescreenrecorder="wf-recorder -a -c h264_vaapi -C aac -d /dev/dri/renderD128 --file=recording.mp4"

#btrfs aliases
alias btrfsfs="sudo btrfs filesystem df /"
alias btrfsli="sudo btrfs su li / -t"

#snapper aliases
alias snapcroot="sudo snapper -c root create-config /"
alias snapchome="sudo snapper -c home create-config /home"
alias snapli="sudo snapper list"
alias snapcr="sudo snapper -c root create"
alias snapch="sudo snapper -c home create"

#Leftwm aliases
alias lti="leftwm-theme install"
alias ltu="leftwm-theme uninstall"
alias lta="leftwm-theme apply"
alias ltupd="leftwm-theme update"
alias ltupg="leftwm-theme upgrade"

#arcolinux applications
#att is a symbolic link now
#alias att="archlinux-tweak-tool"
alias adt="arcolinux-desktop-trasher"
alias abl="arcolinux-betterlockscreen"
alias agm="arcolinux-get-mirrors"
alias amr="arcolinux-mirrorlist-rank-info"
alias aom="arcolinux-osbeck-as-mirror"
alias ars="arcolinux-reflector-simple"
alias atm="arcolinux-tellme"
alias avs="arcolinux-vbox-share"
alias awa="arcolinux-welcome-app"

#git
alias rmgitcache="rm -r ~/.cache/git"
alias grh="git reset --hard"

#pamac
alias pamac-unlock="sudo rm /var/tmp/pamac/dbs/db.lock"

#moving your personal files and folders from /personal to ~
alias personal='cp -Rf /personal/* ~'

#create a file called .bashrc-personal and put all your personal aliases
#in there. They will not be overwritten by skel.

[[ -f ~/.bashrc-personal ]] && . ~/.bashrc-personal

#Generic color list
{
	c1='[31m'
	c2='[32m'
	c3='[33m'
	c4='[34m'
	c5='[35m'
	c6='[36m'
	c7='[37m'
	c8='[38m'
	cR='[m'
}

# reporting tools - install when not installed
#neofetch
#screenfetch
#alsi
#paleofetch
#fetch
#hfetch
#sfetch
#ufetch
#ufetch-arco
#sysinfo
#sysinfo-retro
#cpufetch
#colorscript random

## Flashy
# echo "${c7}-----------------------------------------------------------------------"
# pfetch
# echo "${c7}-----------------------------------------------------------------------"
# colorscript -e 18
# echo "${c7}-----------------------------------------------------------------------${cR}"

## Info
# echo "${c7}----------------------------------------------"
# pfetch
# echo "${c7}----------------------------------------------${cR}"
# lli
# echo "${c7}----------------------------------------------${cR}"

## Basic - Info
# echo "${c7}----------------------------------------------"
pfetch
echo ""
# echo "${c7}----------------------------------------------${cR}"

## Basic - Colorscript
# echo "${c7}-----------------------------------------------------------------------"
# colorscript -e 18
# echo "${c7}-----------------------------------------------------------------------${cR}"
