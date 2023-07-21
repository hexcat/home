#!/bin/zsh

set -euo pipefail

install_dir=$(dirname "$0")

# Oh My Zsh
if [[ ! -d ~/.oh-my-zsh ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Powerlevel10k
if [[ ! -a ~/.p10k.zsh ]]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  ln -s "$install_dir/p10k.zsh" ~/.p10k.zsh
fi

# fzf
if [[ ! -d ~/.fzf ]]; then
  git clone --depth=1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --key-bindings --completion
fi

if [[ ! -f ~/.zshrc.pre-hexcat-setup ]]; then
  ln -s --backup --suffix=.pre-hexcat-setup "$install_dir/zshrc" ~/.zshrc
fi
