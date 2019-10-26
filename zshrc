# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/laurencebillingham/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="bullet-train"

#export BULLETTRAIN_PROMPT_ORDER=(
#  time status custom context dir screen perl ruby virtualenv nvm aws go elixir git hg cmd_exec_time
#)
export BULLETTRAIN_PROMPT_ORDER=(
  time status custom dir screen perl ruby virtualenv nvm aws go elixir git hg cmd_exec_time
)

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"


# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# mac end-of-line, previous-word etc.
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

# short ls aliasaes
alias la='ls -a'
alias lt='ls -lrt'

# grep
alias egrep='egrep --color'

# misspellings
alias gti='git'
alias mkdire='mkdir'

# python
## after moving from virtualenvwrapper
##  to pyenv and pyenv-virtualenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

alias workon="pyenv activate"
workon utility-python

## auto upgrade pip after making an new virtualenv
### vim "$(pyenv root)/pyenv.d/virtualenv/after.bash"
### and paste
### ```bash
### upgrade_packages() {
###   PYENV_VERSION=$VIRTUALENV_NAME pyenv-exec pip install --upgrade pip setuptools wheel
### }
### after_virtualenv 'upgrade_packages'
### ```


# editors
## vscode
export PATH=$PATH:/usr/local/bin/code
## vim
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias gvim="/Applications/MacVim.app/Contents/MacOS/MacVim"

# node/js
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# local binaries/scripts
export PATH=$PATH:/Users/$USER/bin

# for AWS log spelunking
alias unbundle-aws-logs='mkdir -p old && find . -type d -maxdepth 1 -iname 'var*' | xargs -I '{}' mv '{}' old && unzip BundleLogs-*.zip && mv BundleLogs*.zip var && mv var var_$(date "+%Y%m%d_%H%M%S")'
alias gunzip-all='find . -iname '*.gz' | xargs gunzip'
alias todays-500s='find ./log/eb-docker -iname '*.log*' | xargs egrep  -B3 "$(date +'%d/%b/%Y').+HTTP/1.1\" 500"'

# ssh tunnels
alias tun-dev-wibble-db-5433='ssh -NL 5433:wibble-db.some_org:5432 dev-proxy'
alias tun-dev-wibble-serv-8093='ssh -NL 8093:wibble-service.some_org:80 dev-proxy'
