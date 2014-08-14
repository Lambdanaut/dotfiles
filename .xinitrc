# These commands are run when I log into my account. 
# It includes setting up my windows manager(Xmonad), running a bunch of pretty terminals, and setting my wallpaper up. 

#Update BASH
cd $HOME
source "$HOME/.bashrc"

#Source XResources
xrdb -merge ~/.Xresources &

#Set The Cursor
xsetroot -cursor_name left_ptr &

#Turn off Annoying Speaker Beeps
xset -b

#Set Wallpaper
feh --bg-fill ~/scripts/wallpaper.png &

#Start Compositing Manager. Makes Windows look nice & Transparent
xcompmgr -c &

#Default Browser
export BROWSER="google-chrome-unstable"
export EDITOR="vim"

#Dim screen
xbacklight -set 50

# Initialize flux to adjust screen's brightness based on zip code/time of day
xflux -z 98008

#Startup Programs
  #DEV
for i in red green yellow
do
  python ~/scripts/randurxvt.py $i &
done
subl3 --class "Sublime" &
  #NET
#chromium &
google-chrome-unstable &
  #CHAT
#skype &
#xchat --class "XChat" &
python ~/scripts/randurxvt.py green "-e irssi" &
  #FILES
thunar --class "Thunar" &
  #BGROUND
#transmission-gtk --class "Transmissision" &

#Start Window Manager
exec $1
