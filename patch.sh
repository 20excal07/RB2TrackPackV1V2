#!/bin/bash

echo "NOTE: YOU WILL ONLY BE ABLE TO APPLY THIS SCRIPT ONCE WITHOUT REUSING THE ORIGINAL FILES!!"
echo "Please make sure you have a backup in case it goes wrong!"
echo ""
echo "This script will:"
echo "   1. Remove all of the on-disc songs, no exceptions"
echo "   2. Remove three bloat video files; two credits BG vids, one attract video"
echo "   3. Insert the track pack songs."
echo "   4. (OPTIONAL) Apply a patch to allow playing drums with a dualshock"
echo ""
read -p "Hit [ENTER] to continue, or [CTRL+C] to back out now."

echo ""
echo "REMOVING ON-DISC SONGS..."
sleep .5
./ArkTool.exe -p . songs/*.* | tail -n +5 | head -n -2 | awk '{split($0, a, " "); print a[3]}' | tr -d '\r' | xargs -L1 -d $'\n' sh -c 'for f do ./ArkTool.exe -d . $f;done' _

echo ""
echo "REMOVING BLOAT VIDEOS..."
sleep .5
./ArkTool.exe -d . videos/letthereberock_attract.pss
./ArkTool.exe -d . videos/rb_endcredits.pss
./ArkTool.exe -d . videos/pi_endcredits.pss

echo ""
echo "INSERTING NEW TRACK PACK SONGS..."
sleep .5
find songs/ -type f -print0 | while IFS= read -r -d $'\0' line; do
    ./ArkTool.exe -a . $line $line
done

echo ""
echo "ALL DONE! Please use ArkToolGUI to rebuild the ARK files next."
echo ""
echo "Would you also like to play drums with the Dualshock controller?"
echo "Please note that this will render the actual drums controller unusable."
read -p "Hit [ENTER] to apply a patch that will enable this, or [CTRL+C] to skip this."
./ArkTool.exe -r . ../../system/run/config/gen/joypad.dtb mod/joypad.dtb
./ArkTool.exe -r . config/gen/beatmatch_controller.dtb mod/beatmatch_controller.dtb
echo ""
echo "Patch applied! Have fun!"
