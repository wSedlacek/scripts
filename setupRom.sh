#!/bin/bash

#Go to Repo Dir
cd $REPO_DIR

# Clear Scrollback Buffer
echo -e '\0033\0143'
clear

#Setting Up Rom
echo ""
echo -e "${kRED}==SETTING-UP-"$DEVICE"==${kNONE}"
echo ""
sleep 3

if [[ -n "$DEVICES" ]]; then
    export TARGET_DIR="$REPO_DIR""$ZIP_DIR""/""$DEVICE"
fi

. build/envsetup.sh
lunch "$ROM_NAME"_"$DEVICE"-userdebug -j$BRUNCH

#Setting Up Rom
echo ""
echo -e "${kGREEN}==SETTING-UP-"$DEVICE"-COMPLETE==${kNONE}"
echo ""
sleep 3

# Clear Scrollback Buffer
echo -e '\0033\0143'
clear
