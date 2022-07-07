#!/bin/bash
# Animesh Bala Ani (ANI717)

sudo usermod -aG i2c $USER
./jupyter.sh
./jetbot_stats.sh
./pytorch.sh
./torch2trt_onnx.sh
sudo -H python3 -m pip install inputs Adafruit_MotorHat
