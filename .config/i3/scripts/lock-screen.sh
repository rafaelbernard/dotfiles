#!/bin/sh -e

# check requirements
error_log_file="$HOME/lock-screen.i3.error.log"

if ! command -v xdpyinfo &> /dev/null ; then
    msg="$(date) - xdpyinfo is not installed. Install xord-xdpyinfo package"
    touch $error_log_file
    echo $msg >> $error_log_file
    echo $msg
    exit
fi

wallpaper=$(readlink ~/.cache/wallpaper)
lockfile=$wallpaper

if [ "$wallpaper" = "" ]; then
        # take a screenshot
        scrot -o /tmp/screen_shot.png
        
        # pixelit
        mogrify -scale 10% -scale 1000% /tmp/screen_shot.png

        lockfile='/tmp/screen_shot.png'
else
        screen_resolution=$(xdpyinfo | grep dimensions | awk '{print $2}')
        converted='/tmp/wallpaper.png'
        convert $wallpaper -background black -gravity center -resize "$screen_resolution" $converted
        lockfile=$converted
fi


# lock screen displaying the image
#i3lock -i /tmp/screen_shot.png
i3lock --color=000000 -i $lockfile

# Turn the screen off after a delay
sleep 120; pgrep i3lock && xset dpms force off
