#!/bin/bash

#Color Codes
kNONE='\033[00m'
kRED='\033[01;31m'
kGREEN='\033[01;32m'
kYELLOW='\033[01;33m'
kPURPLE='\033[01;35m'
kCYAN='\033[01;36m'
kWHITE='\033[01;37m'
kBOLD='\033[1m'
kUNDERLINE='\033[4m'

#Switch for updateKang's For Switches
clrSwtch(){
   let num=($1%5)+1
   case $num in
    1) COLOR=$kRED ;;
    2) COLOR=$kGREEN ;;
    3) COLOR=$kYELLOW ;;
    4) COLOR=$kPURPLE ;;
    5) COLOR=$kCYAN ;;
   esac
   echo -e "${COLOR}"
}

