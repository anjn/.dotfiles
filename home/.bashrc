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
export HISTSIZE=1000000
export HISTFILESIZE=1000000
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

alias vim='nvim'

# PATH
export PATH=$HOME/bin:$PATH

source ~/.cache/enhancd/init.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jun/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jun/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/jun/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jun/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

