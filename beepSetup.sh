#Setup for Beeps
if [[ "$BEEP" == "1" ]]; then
    # Clear Scrollback Buffer
    echo -e '\0033\0143'
    clear

    echo -e '\a'
    echo -e "${kRED}TESTING BEEPS PLEASE WAIT! ${kNONE}"
    beep -f 900 -l 100
    beep -f 300 -l 300
    beep -f 100 -l 900
    echo -e "${kYELLOW}DID YOU HEAR BEEPS? (y/n) \c${kNONE}"
    read -t 4 $REPLY
    if [ "$REPLY" == "n" ] || [ "$REPLY" == "N" ]; then
        echo -e "${kPURPLE}Password please${kNONE}"
        sudo sleep 1
        sudo modprobe pcspkr
        echo -e '\a'
        echo ""
        beep -f 900 -l 100
        beep -f 300 -l 300
        beep -f 100 -l 900
        echo -e "${kBLUE}How about now? (y/n) ${kNONE}"
        read $REPLY2
        if [ "$REPLY2" == "n" ] || [ "$REPLY2" == "N" ]; then
            sudo apt-get install beep
            beep -f 900 -l 100
            beep -f 300 -l 300
            beep -f 100 -l 900
            echo -e "${kRED}Sorry BEEPS may not work if you dint hear this one.${kNONE}"
        fi
    fi

    echo ""
    echo -e "${kGREEN}Computer will beep when builds are cooked.${kNONE}"


    # Clear Scrollback Buffer
    echo -e '\0033\0143'
    clear
fi
