# Rock Band 2 Track Packs Vol.1+2
Porting Rock Band Track Pack Vol.1 + Vol.2 into Rock Band 2 for PlayStation 2

[![Click to watch a demo!](preview.gif)](https://www.youtube.com/watch?v=xfFCk3ADmkU)

## Features
  1.  Complete metadata for songs. (album title, album art, release year, etc.)
  2.  Multitracks are brought over and kept as is.
  3.  Background videos are also brought over and kept as is.
  4.  Optional patch to play drums with your Dualshock controller.

## Requirements
  1.  Rock Band 2 for PS2. NTSC/PAL will work fine.
  2.  Rock Band Track Pack discs. NTSC/PAL doesn't matter, we only need the songs.
  3.  [**IMGburn**](https://www.imgburn.com/)
  4.  Apache3, DiscPatcher, ArkTool and ArkToolGUI - all provided in this repo inside the `tools` folder.
  5.  Any file compression/extraction utility. (WinRAR, etc)
  5.  A softmodded PS2 - you should be able to load backups or play via a USB drive using OpenPS2Loader.
  6.  [A utility to help solve potential issues with dual-layer backups](https://www.psx-place.com/resources/toxic-dual-layer-dvd9-image-patcher.705/)
  7.  A PS2 emulator if you don't have access to a softmodded PS2.
  
## How to do
  1.  Clone this repo.
  2.  Load the track pack disc/ISO image into your drive.
  3.  Copy all files inside `GEN` into the corresponding folders provided - `RBTPV1` and/or `RBTPV2`
      - You can also just open the ISO image with WinRAR/7-Zip or the like and just copy the files that way.
  4.  If you already have RB2 in ISO image form, just load it in Apache3 and skip to **#9**. Otherwise...
  5.  Load the RB2 disc.
  6.  Open Apache3 and select your drive.
  7.  You should only see **Layer 1** at this point; click the `Create ISO image from CD/DVD` button. (to the left of the gear button)
  8.  Save the ISO whereever, then open it in Apache3. It should now reveal **Layer 2** in addition to Layer 1.
      - AFAIK, there are no other applications available out there that can reveal this second layer to you. 
  9.  Right-click anywhere on the left-side window pane, and choose to `Extract All`.
  10. Now copy over everything inside the `GEN` folder to the root of the repo's directory (where you cloned it).
      - You might notice there are `MAIN3`, `MAIN4` and `MAIN5` arks that are *not* inside that `GEN` folder. Those need to be in the repo's root as well. 
  11. Execute `extract.bat`, wait for it to finish.
  12. Execute `patch.bat`, follow the instructions, and wait for it to finish.
  13. Launch ArkToolGUI, open the repo folder (where the `MAIN.HDR` file is), then `File` > `Save As`, save anywhere in a folder labeled `GEN`. You will need this folder when burning to your new ISO image.
  14. Exit ArkToolGUI, and move `MAIN.HDR` to your newly created `GEN` folder, housing the rest of the `MAIN_` files.
      - You MUST exit the tool before performing this step, as this will update the `MAIN.HDR` file as needed.
  15. Launch IMGburn, and choose to `Create image file from files/folders`
  16. Go to `File` > `Load Project` and load the included *.IBB* project file inside the `tools` folder.
  17. Now go to `Input` > `Advanced`, then click `Show Disc Layout Editor`.
  18. Navigate to the folder where you extracted all the RB2 disc contents into.
  19. Insert the following files & folders **in the exact order as listed here**:
      - SLUS_218.00 (might be SLES_xxx.xx if PAL)
      - SYSTEM.CNF
      - GEN/ (the new one you made, not the one from the original disc!)
      - IOP/
      
      (note: while IMGburn may not list the files/folders as such, it will burn them in the exact order you added them.)
  20. Wait for it to finish, then patch the ISO with `DiscPatcher.exe`, with the `Master Disc` option ticked.
  21. **YOU ARE DONE, GO PLAY THE GAME.**

**For reference, the final contents of your ISO should look identical to the original disc, except now you only have these files inside the `GEN` folder (note the lower case letters!):**
  - MAIN.HDR
  - main_0.ark
  - main_1.ark
  - main_2.ark

## What's broken at the moment?
  1. **Tutorial Mode.** This is on purpose, as it helps save disc space. Please don't go into tutorial mode with this disc.
  2. Tour/Career mode is absolutely broken because it's not made to house these new songs. I will attempt to fix this up at some point.
  3. Album art graphics is wonky because I don't have the right tools to have them render properly. Very minor issue though.
