#!/bin/sh

# TODO:
# - read different config files
# - generate them all at once

PALETTE_FILE=everforest.conf

if [ -f $PALETTE_FILE ]; then
    . ./$PALETTE_FILE
else
    echo $PALETTE_FILE not found.
    exit 1
fi

OUTPUT_FILE=./../${NAME}.theme

# xfce4-terminal color palette
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
cat << EOF > $OUTPUT_FILE
[Scheme]
Name=$NAME
ColorForeground=$fg
ColorBackground=$bg0
TabActivityColor=$orange
ColorSelectionUseDefault=FALSE
ColorSelectionBackground=$bg_visual
ColorPalette=$XBlack;$XRed;$XGreen;$XYellow;$XBlue;$XMagenta;$XCyan;$XLightGray;$XDarkGray;$XLightRed;$XLightGreen;$XLightYellow;$XLightBlue;$XLightMagenta;$XLightCyan;$XLightWhite
EOF
