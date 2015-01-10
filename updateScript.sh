#!/bin/bash

#Location of scripts
#Change if not on Google Drive
IN=~/android/scripts
if [[ -z "$IN" ]]; then
   IN=$(pwd)
fi

SCRIPTS=( beepSetup buildRom cleanRom colorCoding evaluateRom nightlyCron pngOpti setupRom updateRom updateScript uploadRom )

for i in {0..10}
do
  SCRIPT=${SCRIPTS[$i]}
  chmod a+x "$IN"/$SCRIPT.sh
  if [ ! -f /usr/bin/$SCRIPT ]; then
    sudo sleep 1
    echo ""
    sudo chmod 77 /usr/bin/
    cp "$IN"/$SCRIPT.sh /usr/bin/$SCRIPT
    sudo chmod 0755 /usr/bin
    echo -e "${kRED}PLEASES RUN AGAIN!${kNONE}"
    echo ""
  else
    cp "$IN"/$SCRIPT.sh /usr/bin/$SCRIPT
  fi
  chmod 666 "$IN"/$SCRIPT.sh
done

echo -e "${kYELLOW}Update PNGQUANT? (y/n) \c${kNONE}"
read -t 4 $REPLY
if [ "$REPLY" == "y" ] || [ "$REPLY" == "Y" ]; then
  echo -e "${kGREEN}Password please${kNONE}"
  sudo sleep 1

  git clone git://github.com/pornel/pngquant.git
  cd pngquant
  ./configure
  make
  sudo make install
  cd ..
  rm -rf pngquant
fi
REPLY=
