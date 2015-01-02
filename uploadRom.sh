#!/bin/bash

#Go to Repo Dir
cd $REPO_DIR

# Clear Scrollback Buffer
echo -e '\0033\0143'
clear

mkdir -p $REPODIR/$DEVICE
cp "$TARGET_DIR""$FILE" "$REPODIR"/"$DEVICE"/"$FILE"
cp "$TARGET_DIR""$MD5" "$REPODIR"/"$DEVICE"/"$MD5"

#Drive
if [ "$DRIVE" == "1" ]; then
    echo ""
    echo -e "${kRED}==Uploading-Builds-to-Google-Drive==${kNONE}"
    echo ""
    sleep 1

    #Setup
    mkdir -p ~/Google\ Drive/Nightlies/$TODAY/$DEVICE
    cp "$REPODIR"/"$DEVICE"/"$FILE" ~/Google\ Drive/Nightlies/$DATE/$DEVICE/$FILE
    cp "$REPODIR"/"$DEVICE"/"$MD%" ~/Google\ Drive/Nightlies/$DATE/$DEVICE/$MD5

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
echo "$ROMNAME"_"$DEVICE""$DATE"".zip"
echo "$ROMNAME"_"$DEVICE""$DATE"".md5"
echo "From"
echo $REPODIR/$DEVICE
cd $REPODIR/$DEVICE
md5sum "$ROMNAME"_"$DEVICE""$DATE".zip > "$ROMNAME"_"$DEVICE""$DATE".zip.md5
# login to ftp server and transfer file
ftp -n -i $SERVER <<EOF
user $USERNAME $PASSWORD
cd $FTPHOMEDIR$FTPTARGETDIR
binary
mput "$ROMNAME"_"$DEVICE""$DATE".zip.md5
mput "$ROMNAME"_"$DEVICE""$DATE".zip
quit
EOF
)fi

#SCPYN
if [[ "$SCPYN" == "1" ]]; then(
. scp-config
echo "Uploading the following"
echo "$ROMNAME"_"$DEVICE""$DATE"".zip"
echo "$ROMNAME"_"$DEVICE""$DATE"".md5"
echo "From"
echo $REPODIR/$DEVICE
cd $REPODIR/$DEVICE
md5sum "$ROMNAME"_"$DEVICE""$DATE".zip > "$ROMNAME"_"$DEVICE""$DATE".zip.md5
# login to via scp and transfer file
scp $REPODIR/$DEVICE/"$ROMNAME"_"$DEVICE""$DATE".zip.md5 $USERNAME@$SERVER:$FTPHOMEDIR/$ROMNAME/"$ROMNAME"_"$DEVICE""$DATE".zip.md5
echo $SCPPASSWORD
scp $REPODIR/$DEVICE/"$ROMNAME"_"$DEVICE""$DATE".zip $USERNAME@$SERVER:$FTPHOMEDIR/$ROMNAME/"$ROMNAME"_"$DEVICE""$DATE".zip
echo $SCPPASSWORD
)fi
