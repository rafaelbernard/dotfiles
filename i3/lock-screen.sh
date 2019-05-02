#!/bin/sh -e

# take a screenshot
scrot /tmp/screen_shot.png

# pixelit
mogrify -scale 10% -scale 1000% /tmp/screen_shot.png

# lock screen displaying the image
i3lock -i /tmp/screen_shot.png

# Turn the screen off after a delay
sleep 60; pgrep i3lock && xset dpms force off
