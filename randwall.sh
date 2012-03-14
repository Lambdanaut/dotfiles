#!/bin/bash

URLS="http://static.simpledesktops.com/desktops/2009/10/31/fall.png
http://static.simpledesktops.com/desktops/2012/01/25/tetris.png
http://static.simpledesktops.com/desktops/2011/12/14/octopus.png
http://static.simpledesktops.com/desktops/2011/11/03/GoodnightCopenhagen.png
http://static.simpledesktops.com/desktops/2011/10/10/Music.png
http://static.simpledesktops.com/desktops/2011/07/11/RainbowPaint.png
http://static.simpledesktops.com/desktops/2011/05/19/desert.png
http://static.simpledesktops.com/desktops/2011/04/16/pixel_office.png
http://static.simpledesktops.com/desktops/2010/11/30/pong.png
http://static.simpledesktops.com/desktops/2010/10/22/Halloween_SKeleTON.png
http://static.simpledesktops.com/desktops/2010/09/13/circuits.png
http://static.simpledesktops.com/desktops/2010/07/02/totoro.png
http://static.simpledesktops.com/desktops/2010/06/12/LUNIK_3.png
http://static.simpledesktops.com/desktops/2010/03/01/Earth.png
http://static.simpledesktops.com/desktops/2009/10/22/deskstripes.png
"

urls=($URLS)
num_urls=${#urls[*]}

randurl=${urls[$((RANDOM%num_urls))]}

wget -O ~/.bin/wallpaper.png $randurl

feh --bg-fill ~/.bin/wallpaper.png
