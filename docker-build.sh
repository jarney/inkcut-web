#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Copy inkcut source so that we can make mods to it.
cp -Rvf ../inkcut/dist/inkcut-2.1.7.tar.gz .
sudo docker build -f Dockerfile -t ghcr.io/uppsala-makerspace/inkcut:latest .

