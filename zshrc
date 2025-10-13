source /Users/mskordal/.oh-my-zsh/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

# Load the theme.
#antigen theme robbyrussell
antigen theme ys
# antigen theme romkatv/powerlevel10k

# Tell Antigen that you're done.
antigen apply

# aliases
alias l="ls -lah"
alias open="xdg-open"

# Path exports
export PATH=$PATH:~/.local/share/eccodes/bin

# Pyenv (handle multiple python versions)
# export PYENV_ROOT="$HOME/.pyenv" >> ~/.zshrc
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH" >> ~/.zshrc
# eval "$(pyenv init - zsh)" >> ~/.zshrc
export PATH=$HOME/.local/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
