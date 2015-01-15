# Initial Setup

#### Go to Home Directory and Remove old .vim folder
cd<br>
or<br>
cd ~<br>
mv .vim .vim.bak<br>

#### Clone Repository
git clone git@repositories.dev.local:verron.knowles/remote-vim.git .vim<br>
or<br>
git clone http://repositories.dev.local/verron.knowles/remote-vim.git .vim<br>

#### Install Plugins
cd .vim<br>
git submodule init<br>
git submodule update<br>

#### Add new Plugin
Change Pathogen install method of

cd ~/.vim/bundle<br>
git clone \[plugin repository\] \[repository name\]<br>
to<br>
cd ~/.vim<br>
git submodule add \[plugin repository\] bundle/\[repository name\] <br>

# Dependency
CTags - sudo apt-get install ctags
