#!/bin/bash

#Go to Repo Dir
cd $REPO_DIR

# Clear Scrollback Buffer
echo -e '\0033\0143'
clear

mkdir -p $REPO_DIR/$DEVICE
cp "$TARGET_DIR""$FILE" "$REPO_DIR"/"$DEVICE"/"$FILE"
cp "$TARGET_DIR""$MD5" "$REPO_DIR"/"$DEVICE"/"$MD5"

#Drive
if [ "$DRIVE" == "1" ]; then
    echo ""
    echo -e "${kRED}==Uploading-Builds-to-Google-Drive==${kNONE}"
    echo ""
    sleep 1

    #Setup
    mkdir -p ~/Google\ Drive/Nightlies/$DATE/$DEVICE
    cp "$REPO_DIR"/"$DEVICE"/"$FILE" ~/Google\ Drive/Nightlies/$DATE/$DEVICE/$FILE
    cp "$REPO_DIR"/"$DEVICE"/"$MD5" ~/Google\ Drive/Nightlies/$DATE/$DEVICE/$MD5

    #Upload
    grive -p ~/Google\ Drive &

    # Clear Scrollback Buffer
    echo -e '\0033\0143'
    clear
fi

#FTP
if [[ "$FTPYN" == "1" ]]; then(
. ftp-config
echo "Uploading the following"
echo "$ROM_NAME"_"$DEVICE""$DATE"".zip"
echo "$ROM_NAME"_"$DEVICE""$DATE"".md5"
echo "From"
echo $REPO_DIR/$DEVICE
cd $REPO_DIR/$DEVICE
md5sum "$ROM_NAME"_"$DEVICE""$DATE".zip > "$ROM_NAME"_"$DEVICE""$DATE".zip.md5
# login to ftp server and transfer file
ftp -n -i $SERVER <<EOF
user $USERNAME $PASSWORD
cd $FTPHOMEDIR$FTPTARGETDIR
binary
mput "$ROM_NAME"_"$DEVICE""$DATE".zip.md5
mput "$ROM_NAME"_"$DEVICE""$DATE".zip
quit
EOF
)fi

#SCPYN
if [[ "$SCPYN" == "1" ]]; then(
. scp-config
echo "Uploading the following"
echo "$ROM_NAME"_"$DEVICE""$DATE"".zip"
echo "$ROM_NAME"_"$DEVICE""$DATE"".md5"
echo "From"
echo $REPO_DIR/$DEVICE
cd $REPO_DIR/$DEVICE
md5sum "$ROM_NAME"_"$DEVICE""$DATE".zip > "$ROM_NAME"_"$DEVICE""$DATE".zip.md5
# login to via scp and transfer file
scp $REPO_DIR/$DEVICE/"$ROM_NAME"_"$DEVICE""$DATE".zip.md5 $USERNAME@$SERVER:$FTPHOMEDIR/$ROM_NAME/"$ROM_NAME"_"$DEVICE""$DATE".zip.md5
echo $SCPPASSWORD
scp $REPO_DIR/$DEVICE/"$ROM_NAME"_"$DEVICE""$DATE".zip $USERNAME@$SERVER:$FTPHOMEDIR/$ROM_NAME/"$ROM_NAME"_"$DEVICE""$DATE".zip
echo $SCPPASSWORD
)fi

rm -rf "$REPO_DIR"/"$DEVICE"
