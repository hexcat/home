#!/bin/zsh

install_dir=${0:a:h}

# Oh My Zsh
if [[ ! -d ~/.oh-my-zsh ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Powerlevel10k
if [[ ! -a ~/.p10k.zsh.pre-hexcat ]]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  ln -s --backup --suffix=.pre-hexcat "$install_dir/p10k.zsh" ~/.p10k.zsh
fi

# fzf
if [[ ! -d ~/.fzf ]]; then
  git clone --depth=1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --key-bindings --completion --no-update-rc
fi

# Zsh
if [[ ! -f ~/.zshrc.pre-hexcat ]]; then
  ln -s --backup --suffix=.pre-hexcat "$install_dir/zshrc" ~/.zshrc
fi
