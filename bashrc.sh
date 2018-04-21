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
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib:/usr/local/lib64/:/usr/lib:/lib:/lib64:/usr/local/libexec/gcc/x86_64-pc-linux-gnu/6.3.0/"
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

alias myastyle="astyle --style=linux --max-code-length=80"

# read-only emacs
function emacsro {
    emacs $1 --eval '(setq buffer-read-only t)'
}

function wikipedia {
    www.sh "http://en.wikipedia.org/wiki/$1"
}

function wikip {
    www.sh "http://en.wikipedia.org/w/index.php?title=$1&printable=yes"
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

function cfunc {
    l="http://pubs.opengroup.org/onlinepubs/9699919799/functions/$1.html"
    offline-browser.sh $l || www.sh $l
}

function lszip {
    find $1 -type f \( -name "*.gz" -o -name "*.tar" -o -name "*.zip" -o -name "*.bz2" -o -name "*.lzma" -o -name "*.iso" -o -name "*.isz" -o -name "*.rar" -o -name "*.7z" \) -exec 7z l {} \;
}

function lndl {
    ln -s `cached-at $1`
}
