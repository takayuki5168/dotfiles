# register ros as apt source and install
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo sh -c 'echo "deb http://packages.ros.org/ros-shadow-fixed/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt update
sudo apt-get install ros-kinetic-ros-base

# setup latest pip
sudo apt install python-setuptools
sudo easy_install pip
sudo pip install -U pip setuptools

# install catkin rosdep wstool
sudo pip install -U catkin_tools rosdep wstool

# create workspace
mkdir -p ~/ros/kinetic/src
cd ~/ros/kinetic/src

# clone jsk-ros-pkg/jsk_robot
git clone https://github.com/jsk-ros-pkg/jsk_robot jsk-ros-pkg/jsk_robot

# initialize catkin source packages
wstool init
wstool merge jsk-ros-pkg/jsk_robot/jsk_pr2_robot/jsk_pr2_startup/jsk_pr2.rosinstall

# clone all repositories
wstool up -j100

# initialize rosdep
sudo rosdep init
rosdep update

# install dependencies
rosdep install --from-paths . -i -r -n -y

# initialize catkin workspace
cd ~/ros/kinetic
source /opt/ros/kinetic/setup.bash  # <- important
catkin config --init --cmake-args -DCMAKE_BUILD_TYPE=RelWithDebInfo

# build
catkin b jsk_2013_04_pr2_610 pr2eus jsk_pr2_startup detect_cans_in_fridge_201202

# register to .bashrc
echo 'source ~/ros/kinetic/devel/setup.bash' >> ~/.bashrc

# other
sudo apt-get install ros-kinetic-jsk-tools
