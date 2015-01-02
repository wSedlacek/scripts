#!/bin/bash

#Go to Repo Dir
cd $REPO_DIR

# Clear Scrollback Buffer
echo -e '\0033\0143'
clear

#Opticharge everything in previously removed folders
if [ "$OPTICHARGE" == "1" ]; then
    echo ""
    echo -e "${kRED}==OPTICHARGING==${kNONE}"
    echo ""
    sleep 3

    echo -e "${kYELLOW}=OPTICHARGING-FRAMEWORKS=${kNONE}"
    echo ""
    sleep 1
    cd frameworks
    find . -name '*.png' -print0 | xargs -0 -P8 -L1 pngquant --ext .png --force --speed 1 -v
    find . -name '*.jpg' -print0 | xargs -0 -P8 -L1 jpegoptim
    cd ..

    echo ""
    echo -e "${kCYAN}=OPTICHARGING-PACKAGES=${kNONE}"
    echo ""
    sleep 1
    cd packages
    find . -name '*.png' -print0 | xargs -0 -P8 -L1 pngquant --ext .png --force --speed 1 -v
    find . -name '*.jpg' -print0 | xargs -0 -P8 -L1 jpegoptim
    cd ..

    echo ""
    echo -e "${kPURPLE}=OPTICHARGING-VENDOR=${kNONE}"
    echo ""
    sleep 1
    cd vendor
    find . -name '*.png' -print0 | xargs -0 -P8 -L1 pngquant --ext .png --force --speed 1 -v
    find . -name '*.jpg' -print0 | xargs -0 -P8 -L1 jpegoptim
    cd ..
    sleep 2

    echo ""
    echo -e "${kGREEN}==OPTICHARGING-COMPLETE==${kNONE}"
    echo ""
    sleep 3

    # Clear Scrollback Buffer
    echo -e '\0033\0143'
    clear
fi
