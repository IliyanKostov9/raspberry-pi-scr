.PHONY: dotfiles-sync
dotfiles-sync:
	cp ~/.zshrc ./dotfiles
	cp ~/.vimrc ./dotfiles

.PHONY: dotfiles-cp
dotfiles-cp:
	cp ./dotfiles/.* ~/
