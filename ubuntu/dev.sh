echo "Now installing vim colors..."
git clone https://github.com/rafi/awesome-vim-colorschemes.git ~/temp/
mv ~/temp/colors/ ~/.vim/colors/
rm -rf ~/temp

echo "Now installing zsh..."
sudo apt install -y zsh
sudo chsh -s $(which zsh)
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
sudo mv /root/.oh-my-zsh ~/
source ~/.zshrc
