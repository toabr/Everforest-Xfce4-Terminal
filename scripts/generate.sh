#!/bin/bash

DIR="$(dirname "$0")"
FileList=("$DIR"/*.conf)
TargetFolder="$DIR"/../colorschemes
OutPutFile=
NAME=

# reads config file and writes theme file
# input: config file
# output: theme file
function buildTheme {
CONFIGFILE="$1"

# shellcheck source=dark-medium.conf
source "$CONFIGFILE"

if [ ! -d "$TargetFolder" ]; then
    mkdir "$TargetFolder"
fi

NAME=$(basename -- "$CONFIGFILE")
NAME="${NAME%.*}"
OutPutFile=$TargetFolder/everforest-${NAME}.theme

echo writing "${NAME}".theme in "$TargetFolder"

# map everforest to terminal colors
XBlack=$bg_dim
XRed=$red
XGreen=$green
XYellow=$yellow
XBlue=$blue
XMagenta=$purple
XCyan=$aqua
XLightGray=$grey2
XDarkGray=$grey0
XLightRed=$red
XLightGreen=$green
XLightYellow=$yellow
XLightBlue=$blue
XLightMagenta=$purple
XLightCyan=$aqua
XLightWhite=$fg

# write to file
cat << EOF > "$OutPutFile"
# https://github.com/sainnhe/everforest
[Scheme]
Name=Everforest-$NAME
ColorForeground=$fg
ColorBackground=$bg0
TabActivityColor=$orange
ColorSelectionUseDefault=FALSE
ColorSelectionBackground=$bg_visual
ColorPalette=$XBlack;$XRed;$XGreen;$XYellow;$XBlue;$XMagenta;$XCyan;$XLightGray;$XDarkGray;$XLightRed;$XLightGreen;$XLightYellow;$XLightBlue;$XLightMagenta;$XLightCyan;$XLightWhite
EOF
}

# loop over all config files
for i in "${FileList[@]}"; do buildTheme "$i"; done


