#!/bin/bash

echo "-[HUMBLE INSTALLATION]-"
echo ""
echo "PRESS [ENTER] TO CONTINUE THE INSTALLATION"
echo "IF YOU WANT TO CANCEL, PRESS CTRL + C"
echo ""
echo ""
read

sudo apt update -y
sudo apt install locales -y
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

sudo apt install software-properties-common -y
sudo add-apt-repository universe -y
sudo apt update -y
sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

sudo apt update -y
sudo apt upgrade -y
sudo apt install ros-humble-desktop -y
sudo apt install ros-dev-tools -y
sudo apt install ros-humble-rqt-* -y

sudo apt install python3-vcstool

# timezone setting for dual boot windows 
timedatectl set-local-rtc 1 --adjust-system-clock

sh -c "echo \"source /opt/ros/humble/setup.bash\" >> ~/.bashrc"

sh -c "echo \"export ROS_DOMAIN_ID=0\" >> ~/.bashrc"
sh -c "echo \"export ROS_LOCALHOST_ONLY=1\" >> ~/.bashrc"

sh -c "echo \"alias sb='source ~/.bashrc'\" >> ~/.bashrc"

source $HOME/.bashrc

echo "[Complete!!!]"
exit 0
