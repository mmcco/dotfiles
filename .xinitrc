#!/bin/sh

xsetroot -solid black
# disable bell
xset b off

unclutter -root &

xset +fp /usr/local/share/fonts/cantarell
xset +fp /usr/local/share/fonts/Hack
xset +fp /usr/local/share/fonts/misc
xset +fp /usr/local/share/fonts/Droid
# causes ugly Firefox PDF rendering
#xset +fp /usr/local/share/fonts/ghostscript

ssh-agent env LC_CTYPE="en_US.UTF-8" \
	LC_MESSAGES="en_US.UTF-8" \
	LANG="en_US.UTF-8" \
	LC_MESSAGES="en_US.UTF-8" \
	LC_MONETARY="en_US.UTF-8" \
	LC_NUMERIC="en_US.UTF-8" \
	LC_TIME="en_US.UTF-8" \
	awesome
	#fvwm2 -f ${HOME}/.fvwm/config
	#openbox --config-file /home/mike/.config/openbox/rc.xml
	#gnome-session
