fpath=(~/.dotfiles/functions $fpath)

autoload -U ~/.dotfiles/functions/*(:t)

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git
         command-not-found
         zsh-autosuggestions
         zsh-syntax-highlighting)

ENABLE_CORRECTION="true"

# User configuration

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi