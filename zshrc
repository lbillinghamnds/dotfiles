# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/<user>/.oh-my-zsh

# Theme
ZSH_THEME="bullet-train"

# propmt order
#default export BULLETTRAIN_PROMPT_ORDER=(
#  time status custom context dir screen perl ruby virtualenv nvm aws go elixir git hg cmd_exec_time
#)
export BULLETTRAIN_PROMPT_ORDER=(
  time status custom dir screen perl ruby virtualenv nvm aws go elixir git hg cmd_exec_time
)

# use case-sensitive completion.
CASE_SENSITIVE="true"

# format command execution time
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

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

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

# python
export WORKON_HOME="$HOME/.local/share/virtualenvs"
export PROJECT_HOME="$HOME/code"
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
source $HOME/Library/Python/3.6/bin/virtualenvwrapper.sh

#   activate the relavent virtualenv when we cd into a project dir
function _virtualenvwrapper_auto_activate()
{
    if [ "$PWD" != "$MYOLDPWD" ]; then
        MYOLDPWD="$PWD"
        test -e .venv && workon `cat .venv`
    fi
}
prmptcmd() { _virtualenvwrapper_auto_activate }
precmd_functions=(prmptcmd)

# code
export PATH=$PATH:/usr/local/bin/code

# node/js
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
