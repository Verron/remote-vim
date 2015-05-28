# Initial Setup

### Go to Home Directory and Remove old .vim folder.
	cd ~
	mv .vim .vim.bak

### Don't forget to source the file

	vim .vimrc
Add "source .vim/.vimrc" to the file without quotations

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

    mkdir ~/.config/terminator
    cp ~/.vim/configurations/terminator/config ~/.config/terminator/

## CentOS/RHEL and older VIM
CentOS's repositories contain an older version of VIM. Enter the following to upgrade. This has been tested on CentOS 6.5. If you have permission issues, try using sudo
### Install/Upgrade Python
To choose a version of Python newer than 2.7.9, visit https://www.python.org/ftp/python/

	yum groupinstall -y 'development tools'
	yum install -y zlib-dev openssl-devel sqlite-devel bzip2-devel xz-libs
	cd && wget https://www.python.org/ftp/python/2.7.9/Python-2.7.9.tar.xz
	xz -d Python-2.7.9.tar.xz
	tar -xvf Python-2.7.9.tar && rm -f Python-2.7.9.tar
	cd Python-2.7.9/ && ./configure && make && make altinstall
	ln -s /usr/local/bin/python2.7 /usr/bin/python2.7
### Install/Upgrade VIM
Remove yum's VIM and compile from source

	yum remove -y vim
	yum install -y python-devel
	
## Install ctrlp-cmatcher
Faster than the matcher used using vimscript

    sudo apt-get install python-dev
    cd bundle/ctrlp-cmatcher/
    ./install.sh 
