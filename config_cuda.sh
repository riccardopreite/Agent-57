#!/bin/sh
echo "Getting Cuda 10.1 and nvidia machine learning deb..."
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.1.243-1_amd64.deb
wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb

echo "Installing Cuda 10.1 deb..."
dpkg -i cuda-repo-ubuntu1804_10.1.243-1_amd64.deb

tar -xzvf cudnn-10.1-linux-x64-v8.0.5.39.tgz
sudo cp cuda/include/cudnn*.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn*.h /usr/local/cuda/lib64/libcudnn*

echo "Adding Cuda public key to apt..."
apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
echo "Updating apt..."
# apt-get update

echo "Installing nvidia machin learning..."
dpkg -i nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb

apt-get update
echo "Installing cuda libraries..."
apt-get install --no-install-recommends cuda-10-1 libcudnn7=7.6.4.38-1+cuda10.1 libcudnn7-dev=7.6.4.38-1+cuda10.1
apt-get install -y --no-install-recommends libnvinfer6=6.0.1-1+cuda10.1 libnvinfer-dev=6.0.1-1+cuda10.1 libnvinfer-plugin6=6.0.1-1+cuda10.1

# Install NVIDIA driver
echo "Tonstall nvidia driver: 'sudo apt-get install --no-install-recommends nvidia-driver-430' And reboot"


rm nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
rm cuda-repo-ubuntu1804_10.1.243-1_amd64.deb



read -p "Insert your username (where .bashrc is): " USER


BASHRC="/home/$USER/.bashrc"
echo "export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}" >> $BASHRC
echo "export LD_LIBRARY_PATH=/usr/local/cuda/lib64:/ust/local/cuda-10.1/lib64:$LD_LIBRARY_PATH" >> $BASHRC

echo "Added cuda path to LD_LIBRARY_PATH. Reloading shell"
source $BASHRC

echo "Installing required package from requirements.txt ..."
python --m pip install --user -r requirements.txt
