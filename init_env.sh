#!/usr/bin/env bash

# Exit immidiately on failed command (-e), unset variables (-u) or pipefail (-o pipefail)
set -euo pipefail

PKG_MANAGER="unknown"
OS="$(uname -s)"
PRIVILEGE=""
INSTALL_CMD="install"
AUTO_CONFIRM="-y"

# Install zsh
if [[ "$OS" == "Darwin" ]]; then
    # macOS
    if command -v brew &>/dev/null; then
        PKG_MANAGER="brew"
    else
        echo "Homebrew not found. You can install it with:"
        echo '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
        exit 1
    fi
elif [[ "$OS" == "Linux" ]]; then
    PRIVILEGE="sudo"
    if [ -r /etc/os-release ]; then
        # Source os-release where key value pairs are exported
        . /etc/os-release
        DISTRO_ID="${ID,,}"
        DISTRO_LIKE="${ID_LIKE,,}"

        if [[ "$DISTRO_ID" =~ (debian|ubuntu|linuxmint|pop) ]] || [[ "$DISTRO_LIKE" =~ debian ]]; then
            PKG_MANAGER="apt"
        elif [[ "$DISTRO_ID" =~ (fedora|rhel|centos|rocky|almalinux|ol|amazon) ]] || [[ "$DISTRO_LIKE" =~ (rhel|fedora|centos) ]]; then
            PKG_MANAGER="dnf"
        elif [[ "$DISTRO_ID" =~ (opensuse|sles|suse) ]] || [[ "$DISTRO_LIKE" =~ suse ]]; then
            PKG_MANAGER="zypper"
            AUTO_CONFIRM="-n"
        elif [[ "$DISTRO_ID" =~ (arch|manjaro|endeavouros) ]]; then
            PKG_MANAGER="pacman"
            INSTALL_CMD="-S"
            AUTO_CONFIRM="--noconfirm"
        elif [[ "$DISTRO_ID" =~ (alpine) ]]; then
            PKG_MANAGER="apk"
            INSTALL_CMD="add"
            AUTO_CONFIRM=""
        else
            echo "Unknown Linux distro: $DISTRO_ID"
            exit 1
        fi
    else
        echo "Cannot detect Linux distribution (missing /etc/os-release)"
        exit 1
    fi
else
    echo "Unsupported operating system: $OS"
    exit 1
fi

# Install zsh and tmux
${PKG_MANAGER} ${INSTALL_CMD} ${AUTO_CONFIRM} zsh tmux
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Install antigent for zsh
curl -L git.io/antigen > ~/.oh-my-zsh/antigen.zsh
# Install uv
curl -LsSf https://astral.sh/uv/install.sh | sh
# Install tpm for tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Clone rc files
cp zshrc ~/.zshrc
sed -i.bak "1s|^source .*antigen.zsh|source $HOME/.oh-my-zsh/antigen.zsh|" "$HOME/.zshrc"
cp tmux.conf ~/.tmux.conf
cp vimrc ~/.vimrc
# Install vim-plug plugins in vim
nvim +PlugInstall +qall
