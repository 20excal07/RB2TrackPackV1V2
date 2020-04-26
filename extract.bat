@echo off
setlocal EnableDelayedExpansion

echo EXTRACTING FROM TRACK PACK VOL.1 ...

for /f "tokens=3 delims= " %%G in ('ArkTool.exe -p RBTPV1 songs/*.* ^| findstr /i "songs"') do (
	echo %%G | find "songs/gen/" >nul
	if !errorlevel! == 1 (ArkTool.exe -e RBTPV1 %%G .)
)

echo.
echo EXTRACTING FROM TRACK PACK VOL.2 ...

for /f "tokens=3 delims= " %%G in ('ArkTool.exe -p RBTPV2 songs/*.* ^| findstr /i "songs"') do (
	echo %%G | find "songs/gen/" >nul
	if !errorlevel! == 1 (ArkTool.exe -e RBTPV2 %%G .)
)

echo.
echo ALL DONE^^!
echo.

pause
