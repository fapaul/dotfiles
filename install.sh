./brew.sh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..

pip3 install neovim
pip3 install pep8
pip3 install flake8
pip3 install black
pip3 install mypy

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp .gitignore_global ~
cp .zshrc ~
cp .zprofile ~
cp .gitconfig ~
cp -R .config ~

cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/pkulev/zsh-rustup-completion.git rustup
