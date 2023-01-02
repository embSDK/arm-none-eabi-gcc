#! /bin/bash

docker build ./ -t embsdk/arm-none-eabi-gcc
docker run embsdk/arm-none-eabi-gcc arm-none-eabi-gcc -v
