#!/bin/bash

#Go to Repo Dir
cd $REPO_DIR

# Clear Scrollback Buffer
echo -e '\0033\0143'
clear

#Cleaning Rom
echo ""
echo -e "${kRED}==CLEANING==${kNONE}"
echo ""
sleep 3

#Reset for fresh dates
if [[ "$FRESH_DATES" == "1" ]]; then
    echo ""
    echo -e "${kPURPLE}=CLEANING-DATES=${kNONE}"
    echo ""
    sleep 1
    rm -f "$TARGET_DIR"system/build.prop
    rm -f "$TARGET_DIR"system/app/*.odex
    rm -f "$TARGET_DIR"system/framework/*.odex
    rm -rf "$TARGET_DIR"*.zip
    rm -rf "$TARGET_DIR"*.zip.md5sum
    rm -f out/target/product/*/obj/KERNEL_OBJ/.version
elif [[ $(date '+%a') == "$CLEAN" ]]; then
    echo ""
    echo -e "${kPURPLE}=CLEANING-DATES=${kNONE}"
    echo ""
    sleep 1
    rm -f "$TARGET_DIR"system/build.prop
    rm -f "$TARGET_DIR"system/app/*.odex
    rm -f "$TARGET_DIR"system/framework/*.odex
    rm -rf "$TARGET_DIR"*.zip
    rm -rf "$TARGET_DIR"*.zip.md5sum
    rm -f out/target/product/*/obj/KERNEL_OBJ/.version
fi

#Clean out kernels
if [[ "$CLEAN_KERNELS" == "1" ]]; then
    echo ""
    echo -e "${kYELLOW}=CLEANING-KERNELS=${kNONE}"
    echo ""
    sleep 1
    rm -rf .repo/local_manifests
elif [[ $(date '+%a') == "$CLEAN" ]]; then
    echo ""
    echo -e "${kYELLOW}=CLEANING-KERNELS=${kNONE}"
    echo ""
    sleep 1
    rm -rf .repo/local_manifests
fi

#Opticharge Major Players in Drawables
# Remove these locations because of merge conflicts
if [[ "$OPTICHARGE" == "1" ]]; then
    echo ""
    echo -e "${kCYAN}=CLEANING-REPOS=${kNONE}"
    echo ""
    sleep 1
    rm -rf frameworks
    rm -rf packages
    rm -rf vendor
#Clean on Trash Day.
elif [[ $(date '+%a') == "$CLEAN" ]]; then
    echo ""
    echo -e "${kCYAN}=CLEANING-REPOS=${kNONE}"
    echo ""
    sleep 1
    rm -rf frameworks
    rm -rf packages
    rm -rf vendor
fi

#Remove Old Nightlies
if [ "$DRIVE" == "1" ]; then
    echo ""
    echo -e "${kYELLOW}=CLEANING-NIGHTLIES=${kNONE}"
    echo ""
    sleep 1
    old=`date +'%m%d%y' -d "$end_date-4 days"`
    rm -rf ~/Google\ Drive/Nightlies/$old/
fi

#Clobber
if [[ $(date '+%a') == "$CLEAN" ]]; then
    echo ""
    echo -e "${kRED}=CLOBBERING=${kNONE}"
    echo ""
    sleep 1
    rm -rf out
fi

#CLEANING
echo ""
echo -e "${kGREEN}==CLEANING-COMPLETE==${kNONE}"
echo ""
sleep 3

# Clear Scrollback Buffer
echo -e '\0033\0143'
clear
