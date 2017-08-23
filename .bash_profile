### Aliases

# Open specified files in Sublime Text
# "s ." will open the current directory in Sublime
alias s='open -a "Sublime Text"'
alias subl='open -a "Sublime Text"'

# Color LS
colorflag="-G"
alias ls="command ls ${colorflag}"
alias l="ls -lF ${colorflag}" # all files, in long format
alias la="ls -laF ${colorflag}" # all files inc dotfiles, in long format
alias lsd='ls -lF ${colorflag} | grep "^d"' # only directories

# Git Shortcuts
alias gstat='git status'
alias gadd='git add .'
alias gcom='git commit -m' # requires you to type a commit message
alias gpush='git push'
eval "$(hub alias -s)"


# Prompt Colors
BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
PURPLE=$(tput setaf 5)
WHITE=$(tput setaf 7)
GRAY=$(tput setaf 248)
RESET="\033[m"

export BLACK
export RED
export YELLOW
export GREEN
export PURPLE
export WHITE
export GRAY
export RESET


# Git branch details
function parse_git_dirty {
	[[ $(git status 2> /dev/null | tail -n1) != *"nothing to commit, working tree clean"* ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

# Prompt
symbol="⨁ "
export PS1="\[${RED}\]\u \[$GRAY\]in \[$GREEN\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]]) \[$PURPLE\]\$(parse_git_branch)\[$GRAY\]\n$symbol\[$RESET\]"


# Combine `mkdir` and `cd`
mkcd () {
  mkdir "$1"
  cd "$1"
}


# WP CLI
PHP_VERSION=`ls /Applications/MAMP/bin/php/ | sort -n | tail -1`
export PATH=/Applications/MAMP/bin/php/${PHP_VERSION}/bin:$PATH


# NVM
export NVM_DIR=~/.nvm
source ~/.nvm/nvm.sh

# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
