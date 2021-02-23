# docker
alias dcp="docker-compose"
export PGDATA='/usr/local/var/postgres'

export PATH="/usr/local/opt/mysql/bin:$PATH"

# goenv settings
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH

export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
eval "$(goenv init -)"

# k8s
alias kc="kubectl"

# git
alias fp="git fetch && git pull"

# github client のauto complete
eval "$(gh completion -s bash)"

# my own scripts
export PATH="$PATH:$HOME/bin"
alias d="diary.sh"

# 環境変数の重複エントリを削除する
# 連想配列が使えるかどうかチェック
if typeset -A &>/dev/null; then
  # 使える場合
  typeset -A _paths
  typeset _results
  while read -r _p; do
    if [[ -n ${_p} ]] && (( ${_paths["${_p}"]:-1} )); then
      _paths["${_p}"]=0
      _results=${_results}:${_p}
    fi
  done <<<"${PATH//:/$'\n'}"
  PATH=${_results/:/}
  unset -v _p _paths _results
else
  # 使えない場合はawkで
  typeset _p=$(awk 'BEGIN{RS=":";ORS=":"} !x[$0]++' <<<"${PATH}:")
  PATH=${_p%:*:}
  unset -v _p
fi

# prompt customize
#export PS1="\n\[\e[30;1m\]┌(\[\e[34;1m\]\u@\h\[\e[30;1m\])-(\[\e[34;1m\]\j\[\e[30;1m\])-(\[\e[34;1m\]\@ \d\[\e[30;1m\])->\[\e[30;1m\]\n└─(\[\e[32;1m\]\w\[\e[30;1m\])-(\[\e[32;1m\]\$(ls -1 | wc -l | sed 's: ::g') files, \$(ls -lah | grep -m 1 total | sed 's/total //')b\[\e[30;1m\])--> \[\e[0m\]"
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "

# github client funtcion
gcre(){
  git init && git add . && git status && git commit - m "Initial commit"
	echo "Type repository name:" && read name
	echo "Type repository description: " && read description;
	gh repo create ${name} --description ${description}
	git remote add origin https://github.com/sayuen0/${name}.git
	git co -b develop
	git push -u origin develop;
}

# 日記や学習ノートを開くSC
alias m="markdown.sh"
alias ty="open -a typora ~/markdowns"
alias t="open -a typora "

# treeコマンドはデフォルトで日本語が文字化けするので置換
alias tree="tree -N"

# lsしたときの色付け
alias ls='ls -G'
export LSCOLORS=Cxfxcxdxbxegedabagacad

# peco
# Ctrl + R で履歴のインクリメンタルサーチ
function peco-history-selection() {
    BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

# ### search a destination from cdr list
function peco-get-destination-from-cdr() {
  cdr -l | \
  sed -e 's/^[[:digit:]]*[[:blank:]]*//' | \
  peco --query "$LBUFFER"
}

### search a destination from cdr list and cd the destination
function peco-cdr() {
  local destination="$(peco-get-destination-from-cdr)"
  if [ -n "$destination" ]; then
    BUFFER="cd $destination"
    zle accept-line
  else
    zle reset-prompt
  fi
}
zle -N peco-cdr
bindkey '^x' peco-cdr
