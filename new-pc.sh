set -e    # causes death on error

sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
sudo apt-get install git vim tmux mksh htop golang vim-addon-manager vim-syntax-go mcabber ghc hlint

sudo sh -c "echo '/bin/mksh' >> /etc/shells"
sudo chsh -s /bin/mksh

ln -f .vimrc ~/.vimrc
mkdir -p ~/.vim/colors
ln -f solarized.vim ~/.vim/colors/

vim-addon-manager install go-syntax

ln -f .tmux.conf ~/.tmux.conf

mv ~/.profile ~/.mkshrc
echo -e "\n. .mike-profile" >> ~/.mkshrc

cat not-done.txt
