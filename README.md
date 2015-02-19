# devprefs
my vim and tmux configs

Linux
-----
ln -s devprefs/dotvimrc     ~/.vimrc
ln -s devprefs/dotvim       ~/.vim
ln -s devprefs/dottmux.conf ~/.tmux.conf

Windows
-------
copy devprefs\dotvimrc c:\users\who.ami\_gvimrc

Git
---
# comment these once i understand git better
git clone https://github.com/logicmonkey/devprefs.git
cd devprefs/
git remote -v
git remote add upstream  https://github.com/logicmonkey/devprefs.git
git remote -v
git fetch upstream
git checkout master
git merge upstream/master
mv ../dot* .
ls
git add dotvim*
git commit -m "added vim stuff"
git push origin master

