./brew.sh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..

pip install neovim
pip install pep8
pip install flake8
pip install black
pip install mypy

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp .gitconfig_global ~
cp .zshrc ~
cp .zprofile ~
cp .gitconfig ~
cp -R .config ~
