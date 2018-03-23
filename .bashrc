# Setup color scheme <brokenman> for list call
alias ll='/bin/ls --color=auto -lF'
alias la='/bin/ls --color=auto -axF'
alias ls='/bin/ls --color=auto -xF'

# Append any additional sh scripts found in /etc/profile.d/:
for y in /etc/profile.d/*.sh ; do [ -x $y ] && . $y; done
unset y

# Setup shell prompt for root <wread and fanthom>
# PS1='\[\033[01;31m\]\u@\h:\[\033[01;32m\]\w\$\[\033[00m\] '
# PS1='\u@\h:\w\$ '
PS1='\$ '
PS2='> '

########
# Mine #
########
export PATH="$HOME/home/mine/bin:$PATH:/usr/local/bin/x86_64-pc-linux-gnu/"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib:/usr/local/lib64/:/usr/lib"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig"

export NLTK_DATA="$NLTK_DATA:$HOME/home/download/nltk_data"

# Note: the SSL on my porteus is broken
# TODO: FIX
alias wget="wget --no-check-certificate"
export PYTHONHTTPSVERIFY=0

alias lynx='lynx -center=off -anonymous -emacskeys' # TODO Use lynx.rc instead
alias 'plugoff-wifi'='su -c ip\ link\ set\ wlan0\ down'
alias 'wifion'='su -c ip\ link\ set\ wlan0\ up'

DEV_CDROM="/dev/sr0"
CDMOUNTAT="$HOME/home/mount/cdrom"
alias mountcd='sudo mount -o ro $DEV_CDROM $CDMOUNTAT'
alias umountcd='sudo umount $CDMOUNTAT'

HISTTIMEFORMAT="%c "
HISTFILESIZE=9999999999
HISTSIZE=9999999999

alias astyle="astyle --style=linux"

# read-only emacs
function emacsro {
    emacs $1 --eval '(setq buffer-read-only t)'
}

function wikipedia {
    www.sh "http://en.wikipedia.org/wiki/$1"
}

function rpmfind {
    l="https://rpmfind.net/linux/rpm2html/search.php?query="
    www.sh "$l$1&arch=i686"
}

function rpminst {
    l="$1"
    dl.sh $l
    a=`cached-at $l`
    cd `dirname $a`
    b=`basename -s .rpm $a`
    rpm2xzm "$b.rpm" && activate "$b.xzm"
}
