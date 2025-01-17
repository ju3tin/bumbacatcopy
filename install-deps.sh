#!/bin/bash

apt-get update
apt-get install -y \
  wget \
  curl \
  libnss3 \
  libgconf-2-4 \
  libatk-bridge2.0-0 \
  libatk1.0-0 \
  libcups2 \
  libx11-xcb1 \
  libxcomposite1 \
  libxdamage1 \
  libxrandr2 \
  --no-install-recommends