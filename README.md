<p align="center">
  <h1 align="center">Headless Jetson Nano Setup with JupyterLab Support</h1>
</p>

Headless Jetson Nano 4GB setup with with Micro-USB cable Without Using Monitor. USB Dongle is required for Wifi Connection. JupyterLab setup included. ROS2 Dasing Installation Included. 

## Colaborators
[Animesh Bala Ani](https://www.linkedin.com/in/ani717/)

## Table of Contents
* [Install Jetson Nano Image OS on microSD card](#install) <br/>
* [Boot Jetson Nano](#boot) <br/>
* [Wifi Connection Setup](#wifi) <br/>
* [Enable I2C Permissions](#i2c) <br/>
* [Download This Repository](#repository) <br/>
* [Install Jupyter Lab](#jupytarlab) <br/>
* [Install ROS2 Dashing](#ros2dashing) <br/>
* [Install Computer Vision Tools](#cv) <br/>


## Install Jetson Nano Image OS on microSD card <a name="install"></a>
Download [balenaEtcher](https://www.balena.io/etcher/) and install it.</br>
Download [Jetson Nano Developer Kit SD Card Image](https://developer.nvidia.com/jetson-nano-sd-card-image-45-0), and write it on a microSD card with **balenaEtcher**.</br>

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
Once connected, go through initial setup until Network Configuration.</br>
Select `dummy0: Unknown Interface`</br>
Once it fails to connect, select `Do not configure the network at this time`</br>
Go through the rest of the steps with the default settings.
Once completed, wait couple of minutes and go to next step.

## Wifi Connection Setup <a name="wifi"></a>
Open Putty and connect using host name `192.168.55.1` or using COM Port<br/>
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
Once login completes, the Micro-USB cable can be disconnected.

## Enable I2C Permissions <a name="i2c"></a>
```
sudo usermod -aG i2c $USER
```

## Download Repository <a name="repository"></a>
```
git clone https://github.com/ANI717/headless_jetson_nano_setup
```

## Install Jupyter Lab <a name="jupytarlab"></a>
```
cd ~/headless_jetson_nano_setup
chmod +x ./jupyter.sh && ./jupyter.sh
```
Open Jupytar Lab in a browser with `<IP Address>:8888` link. Default password is `jetbot`.<br/> 
The interface should look like this (without watermark).<br/>

<img src="JupytarLab.png" alt="JupytarLab Interface" class="inline"/><br/>
[Reference](https://github.com/NVIDIA-AI-IOT/jetbot/wiki/Create-SD-Card-Image-From-Scratch)

## Install ROS2 Dashing <a name="ros2dashing"></a>
```
cd ~/headless_jetson_nano_setup
chmod +x ./dashing.sh && ./dashing.sh
```
[Reference](https://docs.ros.org/en/dashing/Installation/Ubuntu-Install-Debians.html).

## Install Computer Vision Tools <a name="cv"></a>
```
sudo apt-get install -y python3-pip libopenblas-base libopenmpi-dev
sudo python3 -m pip install numpy==1.19.4
sudo python3 -m pip install --upgrade testresources setuptools protobuf
wget https://nvidia.box.com/shared/static/h1z9sw4bb1ybi0rm3tu8qdj8hs05ljbm.whl -O torch-1.9.0-cp36-cp36m-linux_aarch64.whl
sudo python3 -m pip install torch-1.9.0-cp36-cp36m-linux_aarch64.whl torchvision opencv-python
```
