<p align="center">
  <h1 align="center">Headless Jetson Nano Setup.</h1>
</p>

<p align="justify">
This instruction is for Headless Jetson Nano 2GB/4GB setup with Micro-USB cable Without Using Monitor. USB Dongle is required for Wifi Connection using Wifi adapter. Jupyter Notebooks and Jupyter Lab setup included. JupyterLab doesn't need docker. Torch, Torch2trt, ONNX, ONNXRuntime-GPU Torchvision and TensorFlow Installation Included. Update to Python3 on the Jetson is also included.
</p>
  
## Colaborators
[Victor Moses Kulankash](https://www.linkedin.com/in/victorkulankash/)

## Table of Contents
* [Install Jetson Nano Image](#install) <br/>
* [Boot Jetson Nano](#boot) <br/>
* [Wifi Connection Setup](#wifi) <br/>
* [Download This Repository](#repository) <br/>
* [Installing Python3](#python3) <br/>
* [One Command Install All](#all) <br/>
* [Enable I2C Permissions](#i2c) <br/>
* [Install Jupyter Lab](#jupytarlab) <br/>
* [Setup Jetbot Stats](#stats) <br/>
* [Install Torch](#torch) <br/>
* [Install Torch2trt and ONNX](#torch2trt) <br/>
* [Install TensorFlow](#tf) <br/>

## Install Jetson Nano Image <a name="install"></a>
Download [balenaEtcher](https://www.balena.io/etcher/) and install it.</br>
Download [Jetson Nano Developer Kit SD Card Image](https://developer.nvidia.com/jetson-nano-sd-card-image-45-0), and write it on a microSD card (Preferably 32GB or More) with **balenaEtcher**.</br>

## Boot Jetson Nano <a name="boot"></a>
Insert the microSD card to Jetson Nano.</br>
Connect Jetson Nano with a PC/Laptop using Micro-USB cable.</br>
Power On the Jetson Nano and wait for 1-2 minutes.</br>
Download [PuTTY](https://www.putty.org/).<br/>
Open **Putty**, select connection type **serial**.<br/>
The serial line value `COM#` can be found from following in Windows OS.</br>
```
Device Manager > Ports (COM&LPT) > USB Serial Device (COM#)
```
Set the Baud Rate on your Selected Serial COM Port to 115200 and connect<br/>
Once connected, go through initial setup until Network Configuration.</br>
Select `dummy0: Unknown Interface`</br>
Once it fails to connect, select `Do not configure the network at this time`</br>
Alternatively you could use Ethernet internet connection for direct network connectivity
Go through the rest of the steps with the default settings.
Once completed, wait couple of minutes and go to next step.

## Wifi Connection Setup <a name="wifi"></a>
Open Putty and select Serial connection setup using COM Port<br/>
Run following command and reboot Jetson Nano.</br>
```
sudo systemctl restart network-manager.service
```
Log into Jetson Nano and run following command to detect availability of your wifi SSID.</br>
```
nmcli device wifi list
```
Connect to wifi using following command.</br>
```
sudo nmcli device wifi connect <SSID> password <Wifi_Password>
```
Run following command to get the IP address (2nd one).</br>
```
hostname -I
```
Open Putty and connect using the IP address.<br/>
Once login completes, the Micro-USB cable can be disconnected.<br/>
If the steps above don't work you could provide internet connectivity by connecting an Ethernet cable to the Nano's Ethernet port.

## Installing Python3 <a name="python3"></a>
Checks if Python3 is already installed and installs python3 on your jetson.
To see which version of Python 3 you have installed, run:
```
python3 --version
```
if there is no python3 installation, you can easily install Python 3.6 with the following commands:
```
sudo apt-get update
sudo apt-get install python3.6
```

## Download Repository <a name="repository"></a>
```
git clone https://github.com/DeKUT-DSAIL/Headless-Jetson-Nano-Setup.git
```

## One Command to Install All Necessary Dependancies <a name="all"></a>
Installs `Jupyter Notebook` , `Jupyter Lab`, `PyTorch`, `Torchvision`, `Torch2trt`, `ONNX`, `ONNXRuntime-GPU` and `Inputs`.<br/>
Enables I2C Permissions.<br/>
Sets Jetbot Stats.<br/>
Takes aroud 20 minutes to 40 minutes.<br/>
```
cd ~/Headless-Jetson-Nano-Setup
chmod +x ./*.sh && ./install.sh
```

## Enable I2C Permissions <a name="i2c"></a>
```
sudo usermod -aG i2c $USER
```

## Install Jupyter Notebooks and Jupyter Lab <a name="jupytarlab"></a>
```
cd ~/Headless-Jetson-Nano-Setup
chmod +x ./jupyter.sh && ./jupyter.sh
```
Open Jupytar Lab in a browser with `<IP Address>:8888` link. 
Default password is `jetbot`.<br/> 
The interface should look like this (without watermark).<br/>

<img src="JupytarLab.png" alt="JupytarLab Interface" class="inline"/><br/>
[Reference](https://github.com/NVIDIA-AI-IOT/jetbot/wiki/Create-SD-Card-Image-From-Scratch)

## Setup Jetbot Stats <a name="stats"></a>
Setup Jetbot Stats Service to show Jebot status in OLED display.<br/>
```
cd ~/Headless-Jetson-Nano-Setup
chmod +x ./jetbot_stats.sh && ./jetbot_stats.sh
```

## Install Torch and TorchVision <a name="torch"></a>
Installs `PyTorch` and `TorchVision`.<br/>
```
cd ~/Headless-Jetson-Nano-Setup
chmod +x ./pytorch.sh && ./pytorch.sh
```
[PyTorch Wheel](https://forums.developer.nvidia.com/t/pytorch-for-jetson-version-1-9-0-now-available/72048)<br/>

## Install Torch2trt and ONNX <a name="torch2trt"></a>
Installs `Torch2trt`, `ONNX` and `ONNXRuntime-GPU`.<br/>
```
cd ~/Headless-Jetson-Nano-Setup
chmod +x ./torch2trt_onnx.sh && ./torch2trt_onnx.sh
```

## Install TensorFlow <a name="tf"></a>
Installs `TensorFLow`.<br/>
```
cd ~/Headless-Jetson-Nano-Setup
chmod +x ./tensorflow.sh && ./tensorflow.sh
```