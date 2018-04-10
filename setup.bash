sudo apt-get install -y vim emacs24
echo "alias emacs='emacs -nw \$2'" >> ~/.bashrc
source ~/.bashrc

sudo apt-get install -y gnome-tweak-tool ibus-mozc curl

sudo apt-get install -y cmake git clang-format-3.7
sudo ln -s /usr/bin/clang-format-3.7 /usr/bin/clang-format
sudo apt install -y libboost-all-dev
sudo apt install -y python3-pip
sudo pip3 install numpy scipy sklearn matplotlib
git config --global user.name "Takayuki Murooka"
git config --global user.email takayuki5168@gmail.com
git config --global http.sslVerify false
sudo apt install -y doxygen graphviz
sudo apt install -y qt5-default
sudo apt install -y gcc-arm-none-eabi

sudo apt-get install -y zsh fish tmux gnuplot

sudo snap install slack --classic



# その他
# mozcの設定
# Nodejsのインストール
# chromium, Slack, LINEのインストール
