# Setup script for Ubuntu 16.04  
This script sets up an environment named 'standard' with CUDA, cuDNN, Ananconda and the fastai library.  
Before you can execute the script, you first need to manually download Runtime and Developer cudnn for cuda 9.2.
You need to have an account.
Then scp `libcudnn7_7.5.1.10-1+cuda9.2_amd64.deb` and `libcudnn7-dev_7.5.1.10-1+cuda9.2_amd64.deb` to the home directory of the machine.
https://developer.nvidia.com/rdp/cudnn-download#a-collapse751-92
  
## Run  
`$ git clone https://github.com/sbalk/setup_vm.git`  
`$ cd setup_vm`  
`$ bash setup_ub1604.sh`
