#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
setopt inc_append_history
setopt share_history

# Customize to your needs...
export VISUAL="vim"
export EDITOR="vim"
export PICVIEW="gpicview"
export BROWSER="chromium"

# File Extensions
for ext in png jpg gif;		do alias -s $ext=$PICVIEW; done
for ext in html org php com net no;	do alias -s $ext=$BROWSER;done

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias eP='vim ~/.zshrc'
alias eC='vim ~/.conkyrc'
alias eD='vim /home/conor/dwm/config.h'
alias eX='vim ~/.Xresources'
alias redwm='cd /home/conor/dwm; updpkgsums; makepkg -efi'
alias reload='. ~/.zshrc'
alias icons='for i in {50..255}; do  printf "\\$(printf '%03o' $i)\n" ; done'
alias theme='gtk-chtheme'
alias wbox='lftp whatbox'
alias muzak='ncmpcpp'
alias fehbg='feh --bg-scale'
alias ..='cd ..'
alias watch='mplayer'
alias free='dfc'

# Screenshot

alias screener="screenfetch && colours && scrot -cd 5"
alias screen="screenfetch && scrot -cd 5"

# dropbox

alias dropbox="~/.dropbox-dist/dropboxd" #load dropbox daemon

# Alsamixer

alias vol='alsamixer'
if [ $UID -ne 0 ]; then
    alias volstore='sudo alsactl store'
fi

#Git
alias ga='git add .'
alias gp='git push'

#SSH Sessions
alias pint='ssh @'
alias pext='ssh @'
alias sbox='ssh @'

# privileged access

if [ $UID -ne 0 ]; then
    alias sudo='sudo '
    alias tcpdump='sudo tcpdump'
    alias scat='sudo cat'
    alias svim='sudo vim'
    alias root='sudo su'
    alias kick='sudo reboot'
    alias die='sudo poweroff'
    alias sleep='sudo pm-suspend'
    alias update='sudo pacman -Syyu'
    alias whoup='sudo nmap -sN 192.168.2.0/24'
    alias abs='sudo abs'
    alias wifi='sudo wifi-menu -o wlan0'
    alias mmedia='sudo mount /dev/sda3 /media/Media/'
    alias umedia='sudo umount /media/Media/'
fi

# pacman aliases (if applicable, replace 'pacman' with your favourite AUR helper)
if [ $UID -ne 0 ]; then
  alias pac="sudo pacman -S"      # default action     - install one or more packages
  alias pacu="sudo pacman -U"   # '[U]pgrading packages'
  alias pacs="sudo pacman -Ss"    # '[s]earch'         - search for a package using one or more keywords
  alias paci="pacman -Si"    # '[i]nfo'           - show information about a package
  alias pacr="sudo pacman -Rs"     # '[r]emove'         - uninstall one or more packages
  alias pacl="pacman -Sl"    # '[l]ist'           - list all packages of a repository
  alias pacq="pacman -Qi"    # '[l]ist'           - list details about a package
  alias pacll="pacman -Qqm"  # '[l]ist [l]ocal'   - list all packages which were locally installed (e.g. AUR packages)
  alias paclo="pacman -Qdt"  # '[l]ist [o]rphans' - list all packages which are orphaned
  alias paco="pacman -Qo"    # '[o]wner'          - determine which package owns a given file
  alias pacf="pacman -Ql"    # '[f]iles'          - list all files installed by a given package
  alias pacc="sudo pacman -Sc"    # '[c]lean cache'    - delete all not currently installed package files
  alias pak="sudo packer -S"
fi
  alias pacm="makepkg -fci"  # '[m]ake'           - make package from PKGBUILD file in current directory
  alias aur="sudo packer -Syu" # - upgrade AUR compnents via packer

# Fonts
alias Fonts='fc-cache -vf ~/.fonts'
alias font-check='echo "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699"'

# Misc

alias :q="exit"
alias c='clear'
alias h='cd ~/'
alias ulb='cd /usr/local/bin/'
alias starwars='telnet towel.blinkenlights.nl'

# Functions

# Create archive

compress () {
    if [ -n "$1" ] ; then
        FILE=$1
        case $FILE in
        *.tar)      shift && tar cf $FILE $* ;;
        *.tar.bz2)  shift && tar cjf $FILE $* ;;
        *.tar.gz)   shift && tar czf $FILE $* ;;
        *.tgz)      shift && tar czf $FILE $* ;;
        *.zip)      shift && zip $FILE $* ;;
        *.rar)      shift && rar $FILE $* ;;
        esac
    else
        echo "usage: compress <archive.tar.gz> <archive> <files>"
    fi
}

#Unpack archive

function unpack() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xjf $1    ;;
            *.tbz2)     tar xjf $1    ;;
            *.tar.gz)   tar xzf $1    ;;
            *.tgz)      tar xzf $1    ;;
            *.bz2)      bunzip2 $1    ;;
            *.rar)      unrar x $1    ;;
            *.gz)       gunzip $1     ;;
            *.tar)      tar xf $1     ;;
            *.zip)      unzip $1      ;;
            *.Z)        uncompress $1 ;;
            *.7z)       7z x $1       ;;
            *) echo -e ${YELLOW}"'$1' cannot be unpacked"${RESET} ;;
        esac
    else
        echo -e ${YELLOW}"'$1' is an invalid file"${RESET}
    fi
}


#Generate random password

function genpass() {
        local l=$1
        [ "$l" == "" ] && l=16
        tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}

#upload to bB

function imageup() {
	curl https://images.baconbits.org/upload.php -X POST -F "ImageUp=@$1"
	}

#Can't be arsed with ps bollocks and such

function checkup() {
	ps aux | grep $1 | grep -v grep
	}

function hg() {
     history 0 | grep $1 | grep -v grep
      }

function gc() {
     git commit -m "$1"
       }
