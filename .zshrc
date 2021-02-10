export PATH="/usr/local/opt/openjdk/bin:$PATH"

export JAVA_HOME=`/usr/libexec/java_home -v "1.8"`
PATH=${JAVA_HOME}/bin:${PATH}

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# ssh鍵パスワード認証をパスさせる 永続化
ssh-add -K ~/.ssh/id_rsa

#エイリアス
alias gap="git add -p" #git ステージするファイル選択
alias dcp="docker-compose"
alias fp="git fetch && git pull"

# MYSQL
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/mysql@5.7/lib"
export CPPFLAGS="-I/usr/local/opt/mysql@5.7/include"

alias ls='ls -FG --color'
alias ll='ls -alFG --color'

# Goenv 用の環境変数
export GOENV_DISABLE_GOPATH=1
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
# 実行
eval "$(goenv init -)"

# GOROOTはgoenvのdefault
export PATH="$GOROOT/bin:$PATH"
# GOPATHは自分で設定
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Go Modules 用の環境変数
export GO111MODULE=on

[[ -s "/Users/akira.kosuda/.gvm/scripts/gvm" ]] && source "/Users/akira.kosuda/.gvm/scripts/gvm"

# my own script
export PATH="$PATH:$HOME/bin"
alias t="task.sh"
alias n="note.sh"
alias ty="open -a typora ~/markdowns/"
alias d="t"
# history にコマンド実行時刻を記録する
setopt extended_history
