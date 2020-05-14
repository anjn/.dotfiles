if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\n\$ '
fi

stty stop undef
stty start undef

# History
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL=ignorespace:erasedups
#export HISTIGNORE='pwd:ls:ls *:ll:w:top:df *'
export PROMPT_COMMAND='history -n; history -w; history -c; history -r'
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

# PATH
export PATH=$HOME/bin:$PATH

