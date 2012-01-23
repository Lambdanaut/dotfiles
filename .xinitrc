# These commands are run when I log into my account. 
# It includes setting up my windows manager(Xmonad), running a bunch of pretty terminals, and setting my wallpaper up. 

#Set The Cursor
xsetroot -cursor_name left_ptr &

#Set Wallpaper
feh --bg-scale ~/.bin/wallpaper.png &

#Start Compositing Manager. Makes Windows look nice & Transparent
xcompmgr -c &

#Start Screensaver
xscreensaver -no-splash &

#Default Browser
export BROWSER="chromium"
export EDITOR="vim"

#Startup Programs
chromium&
skype &

for i in red green blue yellow pink
do
  python ~/.bin/randurxvt.py $i &
done

evolution &
transmission-gtk --class "Transmissision" &
xchat --class "XChat" &

#Start Devmon for auto-mounting devices and Window Manager
exec ck-launch-session bash -c "devmon & xmonad"
