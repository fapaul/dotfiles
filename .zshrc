# Path to your oh-my-zsh installation.
export ZSH=/Users/$USER/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
#ZSH_THEME="powerlevel9k/powerlevel9k"
DEFAULT_USER=$USER

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Set default path of nvm for installed node packages
#export NVM_DIR=~/.nvm
#source $(brew --prefix nvm)/nvm.sh

# auto-completion
fpath=(/usr/local/share/zsh-completions $fpath)

# rbenv autocompletion
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Set Homebrew Api Token for Github
export HOMEBREW_GITHUB_API_TOKEN=e55805c379c05766c84a547409450a0bc1fc3318

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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git kubectl rustup minikube aws)
autoload -U compinit && compinit
#
# User configuration

# Anaconda linking

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$HOME/anaconda/bin:$PATH"

#export PATH="/usr/local/bin:/usr/bin:/bin:/usr/ehco:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"
#

# Rust setup

export PATH="$HOME/.cargo/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# You may need zu Mannually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# ruby path
export PATH=$(brew --prefix ruby)/bin:$PATH

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

cat() {
    local out colored
    out=$(/bin/cat $@)
    colored=$(echo $out | pygmentize -f console -g 2>/dev/null)
    [[ -n $colored ]] && echo "$colored" || echo "$out"
}
fpath=(/usr/local/share/zsh-completions $fpath)


# Docker cheats
alias docker-stop-all='docker stop $(docker ps -a -q)'
alias docker-rm-all='docker rm $(docker ps -a -q)'

# Helm cheat
alias helm-delete-all='helm delete $(helm ls --short) --purge'

# Delete all kubernetes pvcs

kubeDeletePvcs() {
    kubectl get persistentvolumeclaims --namespace $1 | awk 'NR>1 {print $1}' | xargs kubectl delete persistentvolumeclaims --namespace $1
    kubectl get pv --namespace $1 | awk 'NR>1 {print $1}' | xargs kubectl delete pv --namespace $1
}

alias arduino="arduino-builder"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Golang Magic
export GOPATH=~/go
export PATH=$GOPATH/bin:$PATH

export EDITOR="nvim"

alias gd='git diff HEAD^ HEAD'
