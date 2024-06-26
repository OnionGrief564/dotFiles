#!/bin/sh

adding_config_folder(){
	read -p "Choose a path for dotfiles source to copy into ~/.dotfiles (wsl format) " dotfiles_path
	ln -s $dotfiles_path ~/.dotfiles
}

install_ubuntu(){
	# apt-get install sudo -y
	sudo apt-get update -y
	sudo apt-get install tmux -y
	sudo apt-get install git -y
	sudo apt-get install zsh -y
	chsh -s /bin/zsh
	echo "[!] DELETING ~/.bashrc"
	rm ~/.bashrc
	ln -s ~/.dotfiles/bashrc ~/.bashrc
}

install_zsh(){
	echo "[!] DELETING ~/.zshrc"
	rm ~/.zshrc
	ln -s ~/.dotfiles/zshrc ~/.zshrc
	echo "[!] ENTER exit manually!"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

install_tmux(){
	mkdir ~/.tmux 
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
}

install_vim(){
	sudo apt install neovim

	# vim config
	mkdir -p ~/.config/nvim/
	cat >> ~/.config/nvim/init.vim<<EOF
source ~/.dotfiles/vim/without_plugins.vim
source ~/.dotfiles/vim/plugins.vim
source ~/.dotfiles/vim/general.vim
source ~/.dotfiles/vim/init.vim

command! EditSettings :e ~/.config/nvim/init.vim
EOF

	# Installing vim-plug via sh script
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

	nvim -c "PlugInstall"
}

adding_config_folder || exit 1
install_ubuntu || exit 2
install_tmux || exit 3
install_vim || exit 4
install_zsh || exit 5
