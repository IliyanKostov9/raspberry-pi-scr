echo "Now installing zsh for better dev experience..."
sudo apt install -y zsh
sudo chsh -s $(which zsh)
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
echo "plugins=(git zsh-autosuggestions)" >> ~/.zshrc
source ~/.zshrc
