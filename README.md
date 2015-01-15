# Initial Setup

### Go to Home Directory and Remove old .vim folder
	cd
or

	cd ~
Move old vim folder

	mv .vim .vim.bak

### Clone Repository
	git clone git@repositories.dev.local:verron.knowles/remote-vim.git .vim
or

	git clone http://repositories.dev.local/verron.knowles/remote-vim.git .vim

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
CTags

	sudo apt-get install ctags
