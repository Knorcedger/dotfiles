# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="kardan"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-completions zsh-syntax-highlighting)

# User configuration

# npm
alias ni='npm install'
alias nis='npm install --save'
alias nisd='npm install --save-dev'
alias nig='npm install -g'
alias nr='npm run'
alias nt='npm test'
alias ns='npm start'
alias nit='npm install && npm test'
alias nf='npm cache clean -f && rm -rf node_modules && npm install'
alias nl='npm list --depth=0'

alias cdd='cd ~/dev'

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8
