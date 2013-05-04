#TODO: add support for VGA
#default monitor is LVDS1
MONITOR=LVDS1

# functions to switch from LVDS1 to HDMI and vice versa
function ActivateHDMI {
    echo "Switching to HDMI1"
    xrandr --output HDMI1 --mode 1920x1080 --dpi 160 --output LVDS1 --off
    MONITOR=HDMI1
}
function DeactivateHDMI {
    echo "Switching to LVDS1"
    xrandr --output HDMI1 --off --output LVDS1 --auto
    MONITOR=LVDS1
}

# functions to check if HDMI is connected and in use
function HDMIActive {
    [ $MONITOR = "HDMI1" ]
}
function HDMIConnected {
    ! xrandr | grep "^HDMI1" | grep disconnected
}

# actual script
while true
do
    if ! HDMIActive && HDMIConnected
    then
        ActivateHDMI
    fi

    if HDMIActive && ! HDMIConnected
    then
        DeactivateHDMI
    fi

    sleep 1s
done
