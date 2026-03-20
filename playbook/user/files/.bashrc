case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\n\$ '
fi

unset color_prompt force_color_prompt

stty stop undef
stty start undef

# History
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL=ignorespace:erasedups

# https://qiita.com/piroor/items/7c9380e408d07fd83bfc
function share_history {
  history -a
  tac ~/.bash_history | awk '!a[$0]++' | tac > ~/.bash_history.tmp
  [ -f ~/.bash_history.tmp ] &&
    mv ~/.bash_history{.tmp,} &&
    history -c &&
    history -r
}
PROMPT_COMMAND='share_history'
shopt -u histappend

# search history
peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    local l=$(\history | awk '{$1="";print}' | eval $tac | peco --layout=bottom-up | sed 's/^ //g')
    READLINE_LINE="${l}"
    READLINE_POINT=${#l}
}

bind -x '"\C-r": peco-select-history'

