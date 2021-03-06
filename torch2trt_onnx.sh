#!/bin/bash

# exit immediately if a command exits with a non-zero status.
set -e

# record script start time
date

# install torch2trt
cd
git clone https://github.com/NVIDIA-AI-IOT/torch2trt 
cd torch2trt 
sudo -H python3 setup.py install --plugins
echo  'alias trtexec="/usr/src/tensorrt/bin/trtexec"' >> ~/.bashrc 

# install onnx and onnxruntime
wget https://nvidia.box.com/shared/static/8sc6j25orjcpl6vhq3a4ir8v219fglng.whl -O onnxruntime_gpu-1.4.0-cp36-cp36m-linux_aarch64.whl
sudo -H pip3 install onnx onnxruntime_gpu-1.4.0-cp36-cp36m-linux_aarch64.whl

# set numpy back to supported version 
sudo -H pip3 install numpy==1.19.4

# record script end time
date

cd ~/Headless-Jetson-Nano-Setup
