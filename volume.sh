amixer get Master | awk -F'[][]' '/%/ {if ($7 == "off") { print "Muted" } else { print "Vol:", $2 }}'
