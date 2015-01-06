#!/bin/bash

#Go to Repo Dir
cd $REPO_DIR

# Clear Scrollback Buffer
echo -e '\0033\0143'
clear

#CLEANING
echo ""
echo -e "${kYELLOW}==SEARCHING-FOR-COMPLETED-ROM==${kNONE}"
echo ""
sleep 3

BUILT=
if [ -f "$TARGET_DIR""$FILE" ]; then
    #Build Completed
    echo ""
    echo -e "${kGREEN}=BUILD-"$DEVICE"-COMPLETED=${kNONE}"
    echo ""
    if [ "$BEEP" == "1" ]; then
        #Beep when done
        beep -f 659 -l 460 -n -f 784 -l 340 -n -f 659 -l 230 -n -f 659 -l 110 -n -f 880 -l 230 -n -f 659 -l 230 -n -f 587 -l 230 -n -f 659 -l 460 -n -f 988 -l 340 -n -f 659 -l 230 -n -f 659 -l 110 -n -f 1047-l 230 -n -f 988 -l 230 -n -f 784 -l 230 -n -f 659 -l 230 -n -f 988 -l 230 -n -f 1318 -l 230 -n -f 659 -l 110 -n -f 587 -l 230 -n -f 587 -l 110 -n -f 494 -l 230 -n -f 740 -l 230 -n -f 659 -l 460
        echo -e '\a'
    fi

    sleep 3
    BUILT=1
else
    #Failed to build
    echo ""
    echo -e "${kRED}=FAILED-TO-FIND-FILE-QUITING-SCRIPT=${kNONE}"
    echo ""
    #Beep when failed
    if [ "$BEEP" == "1" ]; then
        echo -e '\a'
        beep -f 700 -l 200
        beep -f 900 -l 100
        beep -f 300 -l 1000
        beep -f 700 -l 200
        beep -f 900 -l 100
        beep -f 300 -l 1000
        beep -f 700 -l 200
        beep -f 900 -l 100
        beep -f 300 -l 1000
        beep -f 700 -l 200
        beep -f 900 -l 100
        beep -f 300 -l 1000
        echo -e '\a'
    fi
    sleep 3

    echo -e "${kPURPLE}Failed to build $DEVICE. Do you wish to continue?(Y/N)${kNONE}"
    read EXIT_BUILD
    if [[ -z "$EXIT_BUILD" ]]; then
      EXIT_BUILD="Y"
    fi
    echo ""
    if [ "$EXIT_BUILD" != "Y" ] &&  [ "$EXIT_BUILD" != "y" ]; then
      exit 1
    fi
    EXIT_BUILD=

    BUILT=0
fi

# Clear Scrollback Buffer
echo -e '\0033\0143'
clear

export COMPLETED=$BUILT
