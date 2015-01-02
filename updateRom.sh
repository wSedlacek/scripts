#!/bin/bash

#Go to Repo Dir
cd $REPO_DIR

# Clear Scrollback Buffer
echo -e '\0033\0143'
clear

#Update Base
echo ""
echo -e "${kRED}==Downloading-Updates==${kNONE}"
echo ""
sleep 3

#download Source
repo sync -j$SYNC
repo forall -pc git log --reverse --since=1.week.ago > changelog

# Clear Scrollback Buffer
echo -e '\0033\0143'
clear

#Download kernels
for i in $(eval echo {0..$DEVICESNUM})
do
    #More than one Device
    if [[ -n "$DEVICES" ]]; then
        DEVICE=${DEVICES[$i]}
    fi

    echo ""
    echo -e "${kPURPLE}=DOWNLOADING-$DEVICE-KERNEL=${kNONE}"
    echo ""
    lunch "$PREFIX"_"$DEVICE"-"$BUILDTYPE"

    # Clear Scrollback Buffer
    echo -e '\0033\0143'
    clear
done

#Update Base
echo ""
echo -e "${kGREEN}==DOWNLOADING-UPDATES-COMPLETE==${kNONE}"
echo ""
sleep 3

# Clear Scrollback Buffer
echo -e '\0033\0143'
clear
