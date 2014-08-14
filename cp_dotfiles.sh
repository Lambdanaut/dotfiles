#!/bin/bash

declare -A dotfile


# The filename and the location to move the file to/from
dotfile[".vimrc"]="/home/$(whoami)/"
dotfile[".bashrc"]="/home/$(whoami)/"
dotfile[".xinitrc"]="/home/$(whoami)/"

dotfile["randurxvt.py"]="/home/$(whoami)/scripts/"
dotfile["randwall.sh"]="/home/$(whoami)/scripts/"
dotfile["volume.sh"]="/home/$(whoami)/scripts/"
dotfile["wallpaper.png"]="/home/$(whoami)/scripts/"

dotfile["xmonad.hs"]="/home/$(whoami)/.xmonad/"
dotfile[".xmobarrc"]="/home/$(whoami)/"



if [ "$1" = "--export" ]; then
    for c in "${!dotfile[@]}"; do
         cp "$c" "${dotfile[$c]}"
         printf "Exporting %s to %s\n" "$c" "${dotfile[$c]}"
    done
elif [ "$1" = "--import" ]; then
    for c in "${!dotfile[@]}"; do
         cp "${dotfile[$c]}/$c" "$c" 
         printf "Importing %s to %s\n" "${dotfile[$c]}" "$c"
    done
elif [ "$1" = "--list" ]; then
    echo "Names of files and locations to move them to: "
    for c in "${!dotfile[@]}"; do
         printf "%s is in %s\n" "$c" "${dotfile[$c]}"
    done
else
    echo "cp_dotfiles.sh"
    echo "=============="
    echo "--list : List dotfiles and the locations they should be moved to. "
    echo "--import : Loads dotfiles into this folder. "
    echo "--export : Exports dotfiles from this folder into their prospective locations. "
fi

