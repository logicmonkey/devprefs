# env
my vim and tmux configs

Linux
-----
vim needs to see a .vimrc file and .vim directory
ln -s env/nvim              ~/.vim
ln -s env/nvim/init.vim     ~/.vimrc

neovim needs to see just the nvim directory with the init.vim file and eveything else
ln -s env/nvim ~/.config/nvim

ln -s env/dottmux.conf ~/.tmux.conf

Windows
-------
copy env\nvim\init.vim c:\users\who.ami\_gvimrc

Git
---
# comment these once i understand git better
git clone https://github.com/logicmonkey/env.git
cd env/
git remote -v
git remote add upstream  https://github.com/logicmonkey/env.git
git remote -v
git fetch upstream
git checkout master
git merge upstream/master
mv ../dot* .
ls
git add dotvim*
git commit -m "added vim stuff"
git push origin master

