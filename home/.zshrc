# Completion
autoload -Uz compinit
compinit

# Color
autoload -Uz colors
colors

# History
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit
# beep を無効にする
setopt no_beep
# フローコントロールを無効にする
setopt no_flow_control
# Ctrl+Dでzshを終了しない
setopt ignore_eof
# '#' 以降をコメントとして扱う
setopt interactive_comments
# ディレクトリ名だけでcdする
setopt auto_cd
# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups
# 同時に起動したzshの間でヒストリを共有する
setopt share_history
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks
# 高機能なワイルドカード展開を使用する
setopt extended_glob

alias ls="ls -G"
alias ll="ls -Ghl"
alias la="ls -Ghla"

alias vim="nvim"

########################################
# zplug
export ZPLUG_HOME=~/.zsh.d/zplug
source $ZPLUG_HOME/init.zsh

zplug "plugins/git", from:oh-my-zsh, if:"(( $+commands[git] ))"

zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", nice:10

# Theme
zplug "~/.zsh.d/custom.zsh-theme", from:local

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

########################################
eval "$(pyenv init -)"

########################################
eval "$(rbenv init -)"

