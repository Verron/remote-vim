# Initial Setup

### Go to Home Directory and Remove old .vim folder.
	cd ~
	mv .vim .vim.bak

### Don't forget symbolic link

	ln -s .vim/.vimrc .vimrc

### Clone Repository

	git clone https://github.com/Verron/remote-vim .vim

### Install Plugins
	cd .vim
	git submodule init
	git submodule update

### Add new Plugin
Change Pathogen install method of

	cd ~/.vim/bundle
	git clone [plugin repository] [repository name]
to

	cd ~/.vim
	git submodule add [plugin repository] bundle/[repository name] 

# Dependency
## CTags

	sudo apt-get install ctags
## Powerline Fonts

Reference: http://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin

	wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
	sudo mv PowerlineSymbols.otf /usr/share/fonts/
	sudo fc-cache -vf
	sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
## Terminator Solarized Scheme 
See https://github.com/ghuntley/terminator-solarized for more detail
