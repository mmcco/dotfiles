set -e    # causes death on error

sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
sudo apt-get install git vim tmux mksh htop

sudo sh -c "echo '/bin/mksh' >> /etc/shells"
sudo chsh -s /bin/mksh

ln -f .vimrc ~/.vimrc
mkdir -p ~/.vim/colors
ln -f solarized.vim ~/.vim/colors/

ln -f .tmux.conf ~/.tmux.conf

echo -e "\n. .aliases" >> .profile

cat not-done.txt
