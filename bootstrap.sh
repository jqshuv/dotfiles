#!/usr/bin/env bash

# Copyright (c) 2022 Joshua Schmitt
# 
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT


### Setup Node.js ###

apt-get -y install \
    curl \
    bash \
    sudo

curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -


### Setup Yarn ###

curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

apt-get update -q -y \
  && apt-get dist-upgrade -y \
  && apt-get autoremove -y \
  && apt-get autoclean

apt-get -y install nodejs yarn make build-essential gcc g++