# These commands are run when I log into my account. 
# It includes setting up my windows manager(Xmonad), running a bunch of pretty terminals, and setting my wallpaper up. 

#Update BASH
cd $HOME
source "$HOME/.bashrc"

#Set The Cursor
xsetroot -cursor_name left_ptr &
unclutter -idle 20 &

#Turn off Annoying Speaker Beeps
xset -b

#Set Wallpaper
feh --bg-fill ~/.bin/wallpaper.png &

#Start Compositing Manager. Makes Windows look nice & Transparent
xcompmgr -c &

#Start Screensaver
xscreensaver -no-splash &

#Default Browser
export BROWSER="chromium"
export EDITOR="vim"

#Startup Programs
  #DEV
for i in red green blue yellow pink
do
  python ~/.bin/randurxvt.py $i &
done
  #NET
chromium&
  #CHAT
skype &
xchat --class "XChat" &
  #FILES
thunar --class "Thunar" &
  #BGROUND
transmission-gtk --class "Transmissision" &

#Start Window Manager
case $1 in
xmonad)
	exec xmonad
	;;
i3)
	exec i3
	;;
openbox)
	exec openbox
	;;
awesome)
	exec awesome
	;;
*)
	exec xmonad
	;;
esac
