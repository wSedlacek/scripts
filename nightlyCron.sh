#!/bin/bash
IN=~/android/scripts
cd $IN

# Clear Scrollback Buffer
echo -e '\0033\0143'
clear

#Configs
echo ""
echo -e "${kRED}==SETTING VALUES IN CONFIG==${kNONE}"
echo ""
sleep 1
source colorCoding
source nightly-config

# Clear Scrollback Buffer
echo -e '\0033\0143'
clear

#Header
echo -e "${kBOLD}=====NIGHTLY-"$ROM_NAME"-ROM-BUILDING=====${kNONE}"
echo ""
echo -e "${kRED}This scipt will update to the latest vanir source apply,"
echo "Will's Kang Patches, then build Roms and upload them to google drive."
echo -e "${kPURPLE}Updating nightly comands. After this you can,"
echo "just type nightly to run the script. If you see errors,"
echo -e "ctl+c to cancel then rerun with nightly. ${kNONE}"
echo ""
sleep 3

source beepSetup
time source cleanRom
time source updateRom
time source pngOpti

#DEVICEs to BUILD for
for i in $(eval echo {0..$DEVICESNUM})
do
    #More than one Device
    if [[ -n "$DEVICES" ]]; then
        DEVICE=${DEVICES[$i]}
    fi

    source setupRom
    time source buildRom

    COMPLETED=(eval echo source evaluateRom)
    if [ "$COMPLETED" ]; then
        time source uploadRom
    fi

done

echo ""
echo -e "${kYELLOW}===BUILDING-COMPLETE-THANK-YOU-FOR-USING-BUILDER-3000===${kNONE}"""
echo ""
sleep 20
