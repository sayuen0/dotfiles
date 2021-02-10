export PATH="/usr/local/opt/openjdk/bin:$PATH"

export JAVA_HOME=`/usr/libexec/java_home -v "1.8"`
PATH=${JAVA_HOME}/bin:${PATH}

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# ssh鍵パスワード認証をパスさせる 永続化
ssh-add -K ~/.ssh/id_rsa

# git ブランチ名を色付きで表示させるメソッド
function rprompt-git-current-branch {
  local branch_name st branch_status

  if [ ! -e  ".git" ]; then
    # git 管理されていないディレクトリは何も返さない
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # 全て commit されてクリーンな状態
    branch_status="%F{green}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # git 管理されていないファイルがある状態
    branch_status="%F{red}?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # git add されていないファイルがある状態
    branch_status="%F{red}+"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # git commit されていないファイルがある状態
    branch_status="%F{yellow}!"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # コンフリクトが起こった状態
    echo "%F{red}!(no branch)"
    return
  else
    # 上記以外の状態の場合
    branch_status="%F{blue}"
  fi
  # ブランチ名を色付きで表示する
  echo "${branch_status}[$branch_name]"
}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

# プロンプトの右側にメソッドの結果を表示させる
RPROMPT='`rprompt-git-current-branch`'


#エイリアス
alias gap="git add -p" #git ステージするファイル選択
alias dcp="docker-compose"
alias fp="git fetch && git pull"

# MYSQL
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/mysql@5.7/lib"
export CPPFLAGS="-I/usr/local/opt/mysql@5.7/include"

alias ls='ls -FG'
alias ll='ls -alFG'

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
