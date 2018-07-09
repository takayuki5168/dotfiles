sudo apt-get install -y vim emacs24
#echo "alias suspend='systemctl suspend -i'" >> ~/.bashrc

sudo apt-get install -y gnome-tweak-tool curl
sudo apt-get install -y ibus-mozc
# GUIでmozcの追加

sudo apt-get install -y cmake git clang-format-3.7
sudo ln -s /usr/bin/clang-format-3.7 /usr/bin/clang-format
sudo apt install -y libboost-all-dev

sudo apt-get install -y ipython ipython3 python-pip python3-pip
sudo pip3 install numpy scipy sklearn matplotlib keras tensorflow

git config --global user.name "Takayuki Murooka"
git config --global user.email takayuki5168@gmail.com
git config --global http.sslVerify false

sudo apt install -y doxygen graphviz
sudo apt install -y qt5-default
sudo apt install -y gcc-arm-none-eabi

sudo apt-get install ipython ipython3

sudo apt-get install -y zsh fish tmux gnuplot

sudo snap install slack --classic
sudo snap install heroku --classic
sudo apt-get install -y chromium-browser

source ~/.bashrc

# mozcの設定
sudo apt-get install ibus-mozc
killall ibus-daemon
ibus-daemon -d -x &
## 手動設定

# その他
# Nodejsのインストール
# LINEのインストール
