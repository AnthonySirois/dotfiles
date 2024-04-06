ln -s ~/dotfiles/.config/zsh/.zshrc ~/.zshrc
ln -s ~/dotfiles/.config/zsh/powerlevel10k/.p10k.zsh ~/.p10k.zsh
ln -s ~/dotfiles/.config/alacritty/alacritty.toml ~/.alacritty.toml

# apt install 

# Install plugins
# https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# https://github.com/zsh-users/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

