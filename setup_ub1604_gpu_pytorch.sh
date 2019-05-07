###################################################################################
# Before running this script, first download cudnn7 and cudnn7-dev to the machine #
###################################################################################

# This script is designed to work with ubuntu 16.04 LTS
set -x
set -e

# ensure system is updated and has basic build tools
sudo apt-get update
sudo apt-get --assume-yes upgrade
sudo apt-get --assume-yes install tmux build-essential gcc g++ make binutils
sudo apt-get --assume-yes install software-properties-common
sudo apt-get --assume-yes install htop

# download and install GPU drivers
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.2.148-1_amd64.deb -O cuda-repo-ubuntu1604_9.2.148-1_amd64.deb
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
sudo dpkg -i cuda-repo-ubuntu1604_9.2.148-1_amd64.deb
sudo apt-get update
sudo apt-get -y install cuda
sudo modprobe nvidia
nvidia-smi

# install Anaconda for current user
mkdir downloads
cd downloads
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b

echo "export PATH=\"$HOME/miniconda3/bin:\$PATH\"" >> ~/.bashrc
export PATH="$HOME/miniconda3/bin:$PATH"
conda install -y bcolz
conda upgrade -y --all
conda install -y -c pytorch -c fastai fastai
conda install -y jupyter notebook
conda config --add channels conda-forge
conda install -y -c jupyter_contrib_nbextensions
conda install -y -c nb_conda

# Note that JPEG decoding can be a bottleneck, particularly if you have a fast GPU. You can optionally install an optimized JPEG decoder as follows (Linux)
#conda uninstall --force jpeg libtiff -y
#conda install -c conda-forge libjpeg-turbo
#CC="cc -mavx2" pip install --no-cache-dir -U --force-reinstall --no-binary :all: --compile pillow-simd

# install cudnn libraries
sudo dpkg -i libcudnn7_7.5.1.10-1+cuda9.2_amd64.deb
sudo dpkg -i libcudnn7-dev_7.5.1.10-1+cuda9.2_amd64.deb

# configure jupyter and prompt for password
jupyter notebook --generate-config
jupass=`python -c "from notebook.auth import passwd; print(passwd())"`
echo "c.NotebookApp.password = u'"$jupass"'" >> $HOME/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.ip = '*'" >> $HOME/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.open_browser = False" >> $HOME/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.allow_remote_access = True" >> $HOME/.jupyter/jupyter_notebook_config.py

# add sublime style multi cursor code editing
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get --assume-yes install sublime-text
mkdir .jupyter/custom
mv custom.js ~/.jupyter/custom/

# clean up
rm -r cuda-repo-ubuntu1604_9.2.148-1_amd64.deb libcudnn7-dev_7.5.1.10-1+cuda9.2_amd64.deb libcudnn7_7.5.1.10-1+cuda9.2_amd64.deb 
rm -r downloads/Miniconda3-latest-Linux-x86_64.sh downloads/cuda-repo-ubuntu1604_9.2.148-1_amd64.deb

# generate ssh keys
ssh-keygen -t rsa -f $HOME/.ssh/id_rsa -q -N ""
