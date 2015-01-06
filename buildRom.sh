#!/bin/bash

#Go to Repo Dir
cd $REPO_DIR

# Clear Scrollback Buffer
echo -e '\0033\0143'
clear

#Building Rom
echo ""
echo -e "${kRED}==BUILDING-"$DEVICE"==${kNONE}"
echo ""
sleep 3

export BUILDING=1

mka bacon -j$BRUNCH

export BUILDING=

#Building Rom
echo ""
echo -e "${kGREEN}==BUILDING-"$DEVICE"-COMPLETE==${kNONE}"
echo ""
sleep 3
