export LANG=ja_JP.UTF-8

# Colorize
autoload -U colors
colors

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_no_store
setopt appendhistory		    # HISTFILEを上書きせずに追記
setopt hist_ignore_all_dups     # 重複したとき、古い履歴を削除
setopt hist_ignore_space	    # 先頭にスペースを入れると履歴を保存しない
setopt hist_reduce_blanks       # 余分なスペースを削除して履歴を保存
setopt share_history		    # 履歴を共有する

# Command history
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# 補完
autoload -Uz compinit
compinit -u
## 補完候補を一覧表示
setopt auto_list
## TAB で順に補完候補を切り替える
setopt auto_menu
## 補完候補一覧でファイルの種別をマーク表示
setopt list_types
## カッコの対応などを自動的に補完
setopt auto_param_keys
## ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash
## 補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select=2
## 補完候補の色づけ
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
## 補完候補を詰めて表示
setopt list_packed
## スペルチェック
setopt correct
## ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt mark_dirs
## 最後のスラッシュを自動的に削除しない
setopt noautoremoveslash
## 大文字と小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
## 出力の文字列末尾に改行コードが無い場合でも表示
unsetopt promptcr
## ビープを鳴らさない
setopt nobeep
## cd 時に自動で push
setopt auto_pushd
## 同じディレクトリを pushd しない
setopt pushd_ignore_dups
## --prefix=/usr などの = 以降も補完
setopt magic_equal_subst
## ファイル名の展開で辞書順ではなく数値的にソート
setopt numeric_glob_sort
## 出力時8ビットを通す
setopt print_eight_bit
## ディレクトリ名だけで cd
setopt auto_cd
## コマンドラインでも # 以降をコメントと見なす
setopt interactive_comments
## hjklで補完候補を移動できるようにする
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# Prompt
PROMPT="%{${fg[green]}%}[%n@%m:%~]%(?.%{${fg[yellow]}%}.%{${fg[red]}%})$ %{${reset_color}%}"
PROMPT2="%B%{${fg[yellow]}%}%_>%{${reset_color}%}%b "
# バージョン管理されているディレクトリにいれば表示，そうでなければ非表示
RPROMPT="%1(v|%F{green}%1v%f|)"
## 入力が右端まで来たらRPROMPTを消す
setopt transient_rprompt
setopt prompt_subst

autoload -Uz vcs_info

zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'

function precmd() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# function
# ^で上のディレクトリへ
function cdup-or-insert-circumflex() {
    if [[ -z "$BUFFER" ]]; then
        echo
        cd ..
        if type precmd > /dev/null 2>&1; then
            precmd
        fi
        local precmd_func
        for precmd_func in $precmd_functions; do
            $precmd_func
        done
        zle reset-prompt
    else
        zle self-insert '^'
    fi
}
zle -N cdup-or-insert-circumflex
bindkey '\^' cdup-or-insert-circumflex

# Auto 'ls' when 'cd'
function chpwd() {
case "${OSTYPE}" in
    darwin*)
        gls -F --color
        ;;
    linux*)
        ls --color=auto -G
        ;;
esac
}

# alias
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias less='less -iM'
alias more="less '-X -E -PM?f--More-- %f lines %lt-%lb/%L (%pb\%):--More-- lines %lt-%lb.'"

# grepのオプションの設定
export GREP_OPT
# バイナリファイルにはマッチさせない
GREP_OPT="--binary-files=without-match"
GREP_HELP=$(grep --help 2>&1)
# VCS管理用ディレクトリを無視する
if [[ "$GREP_HELP" == *--exclude-dir* ]]; then
    GREP_OPT="--exclude-dir=.svn $GREP_OPT"
    GREP_OPT="--exclude-dir=.git $GREP_OPT"
    GREP_OPT="--exclude-dir=.deps $GREP_OPT"
    GREP_OPT="--exclude-dir=.libs $GREP_OPT"
fi
# 可能なら色を付ける
if [[ "$GREP_HELP" == *--color* ]]; then
    GREP_OPT="--color=auto $GREP_OPT"
fi
alias grep="grep $GREP_OPT"
alias egrep="grep -E $GREP_OPT"
alias fgrep="grep -F $GREP_OPT"

# Make
#alias make='make -s'
alias amke='make'
alias mkae='make'
alias maek='make'

alias vi='vim'
alias nv='vim'

# Environment variables
PATH+=":${HOME}/.robotech/bin"

## ssh先の場合tmux自動起動
#if [[ -n "${REMOTEHOST}${SSH_CONNECTION}" && -z "$TMUX" && -z "$STY" ]] && type tmux >/dev/null 2>&1; then
#    option=""
#    if tmux has-session && tmux list-sessions; then
#        option="attach"
#    fi
#    tmux $option
#fi
