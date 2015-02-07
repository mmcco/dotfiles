# should be run with bash, not sh, because of "echo -e"
# username assumed to be "mike"
set -e    # causes death on error

# to be run from the repo directory
cd ~/dotfiles

sudo sh -c 'echo deb     http://deb.torproject.org/torproject.org $(lsb_release -cs) main >> /etc/apt/sources.list'
gpg --keyserver keys.gnupg.net --recv 886DDD89
gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -

sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
sudo apt-get install git vim tmux mksh htop golang vim-addon-manager vim-syntax-go mcabber ghc hlint gnupg2 build-essential curl
sudo apt-get install deb.torproject.org-keyring
sudo apt-get install tor tor-arm

# tarsnap dependencies
sudo apt-get install libssl-dev zlib1g-dev e2fslibs-dev

sudo sh -c "echo '/bin/mksh' >> /etc/shells"
sudo -u mike chsh -s /bin/mksh

ln -f .vimrc ~/.vimrc
mkdir -p ~/.vim/colors
ln -f solarized.vim ~/.vim/colors/

vim-addon-manager install go-syntax

ln -f .tmux.conf ~/.tmux.conf

mv ~/.profile ~/.mkshrc
echo "\n. .mike-profile" >> ~/.mkshrc

ln -f raymond-rules.py ~/.raymond-rules.py

cat not-done.txt
