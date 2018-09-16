#!/bin/bash

#script to build and install scGraphics.  For details on
#creating and installing packages, see
#https://packaging.python.org/tutorials/packaging-projects/

#create the scGraphics distribution
python3 setup.py sdist

echo "Enter an admin password to install the package"

#install the package
sudo pip3 install dist/scgraphics-2.1.tar.gz

