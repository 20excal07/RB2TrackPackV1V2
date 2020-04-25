@echo off
setlocal EnableDelayedExpansion
SET "pwd=%cd%"

echo.
echo NOTE: YOU WILL ONLY BE ABLE TO APPLY THIS SCRIPT ONCE WITHOUT REUSING THE ORIGINAL FILES^^!^^!
echo Please make sure you have a backup in case it goes wrong^^!
echo. 
echo This script will:
echo    1. Remove all of the on-disc songs, no exceptions
echo    2. Remove three bloat video files; two credits BG vids, one attract video
echo    3. Insert the track pack songs.
echo    4. (OPTIONAL) Apply a patch to allow playing drums with a dualshock
echo.

set /p=Hit [ENTER] to continue, or close this window to back out.

echo.
echo REMOVING ON-DISC SONGS...
timeout 1 >nul
for /f "tokens=3 delims= " %%G in ('ArkTool.exe -p . songs/*.* ^| findstr /i "songs"') do ArkTool.exe -d . %%G

echo.
echo REMOVING BLOAT VIDEOS...
timeout 1 >nul
ArkTool.exe -d . videos/letthereberock_attract.pss
ArkTool.exe -d . videos/rb_endcredits.pss
ArkTool.exe -d . videos/pi_endcredits.pss

echo.
echo INSERTING NEW TRACK PACK SONGS...
timeout 1 >nul
for /f "usebackq tokens=*" %%a in (`dir /s /b /a-d "!pwd!\songs\*.*"`) do (
	set "subdir=%%~a"
	set "subdir=!subdir:%pwd%=!"
	set "arkdir=!subdir:\=/!"
	ArkTool.exe -a . !arkdir:~1! !subdir:~1!
)

echo.
echo ALL DONE! Please use ArkToolGUI to rebuild the ARK files next.
echo.
echo Would you also like to play drums with the Dualshock controller?
echo Please note that this will render the actual drums controller unusable.
set /p=Hit [ENTER] to apply a patch that will enable this, or close the window now and skip this.
ArkTool.exe -r . ../../system/run/config/gen/joypad.dtb mod/joypad.dtb
ArkTool.exe -r . config/gen/beatmatch_controller.dtb mod/beatmatch_controller.dtb
echo.
echo Patch applied^^! Have fun^^!
echo.
pause
