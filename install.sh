cp ~/.bashrc ~/.bashrc.bk

if [ -f ~/.zshrc ]; then
    cp ~/.zshrc ~/.zshrc.bk;
else
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

TEMP=.temp1114

mkdir $TEMP 

cd $TEMP

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

sed -i "40,50s/.*ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=.*/: $\{ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=\"fg=blue\"\}/g" ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

cp zshrc ~/.zshrc


git clone https://github.com/ggreer/the_silver_searcher

sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev

cd the_silver_searcher

./build.sh --prefix=$HOME && make install 

cd ..

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

git clone https://github.com/altercation/vim-colors-solarized.git

cd vim-colors-solarized/colors

if [ ! -d ~/.vim/colors ]; then
    mkdir ~/.vim/colors
fi

mv solarized.vim ~/.vim/colors/

cd -

git clone https://github.com/seebi/dircolors-solarized.git  $HOME/dircolors-solarized


git clone --recursive https://github.com/python-mode/python-mode.git
cd python-mode
cp -R * ~/.vim
cd -

# change vimrc line 219: `let g:pymode_python = 'python3'` if necessary

git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh
./configure --prefix=$HOME
make && make install 
cd ..

cd
git clone https://github.com/gpakosz/.tmux.git
cd -
cp tmux.conf ~/.tmux/.tmux.conf
cp tmux.conf.local ~/
cd 
ln -s -f .tmux/.tmux.conf

cd -
echo zsh >> $HOME/.bashrc

if [ -f ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc.bk
fi

cp vimrc ~/.vimrc

cd ..
rm -rf $TEMP
