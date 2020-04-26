# RB2TrackPackV1V2
Porting Rock Band Track Pack Vol.1 + Vol.2 into Rock Band 2 for PlayStation 2

## Requirements
  1.  Rock Band 2 for PS2. NTSC/PAL will work fine.
  2.  Rock Band Track Pack discs. **At the moment, only Vol.1 is supported.** NTSC/PAL doesn't matter, we only need the songs.
  3.  [**IMGburn**](https://www.imgburn.com/)
  4.  Apache3, DiscPatcher, ArkTool and ArkToolGUI - all provided in this repo inside the `tools` folder.
  5.  Any file compression/extraction utility. (WinRAR, etc)
  5.  A softmodded PS2 - you should be able to load backups or play via a USB drive using OpenPS2Loader.
  6.  Seriously, you can't do this if you don't have #6.
  
## How to do
  1.  Clone this repo.
  2.  Load the track pack disc/ISO image into your drive.
  3.  Copy all files inside `GEN` into the corresponding folders provided - `RBTPV1` and/or `RBTPV2`
  4.  If you already have RB2 in ISO image form, just load it in Apache3 and skip to **#9**. Otherwise...
  5.  Load the RB2 disc.
  6.  Open Apache3 and select your drive.
  7.  You should only see **Layer 1** at this point; click the `Create ISO image from CD/DVD` button. (to the left of the gear button)
  8.  Save the ISO whereever, then open it in Apache3. It should now reveal **Layer 2** in addition to Layer 1.
  9.  Right-click anywhere on the left-side window pane, and choose to `Extract All`.
  10. Now copy over everything inside the `GEN` folder to the root of the repo's directory (where you cloned it).
  11. Execute `extract.bat`, wait for it to finish.
  12. Execute `patch.bat`, follow the instructions, and wait for it to finish.
  13. Launch ArkToolGUI, open the repo folder (where the `MAIN.HDR` file is), then `File` > `Save As`, save anywhere in a folder labeled `GEN`. You will need this folder when burning to your new ISO image.
  14. Exit ArkToolGUI, and move `MAIN.HDR` to your newly created `GEN` folder, housing the rest of the `MAIN_` files.
  15. Launch IMGburn, and choose to `Create image file from files/folders`
  16. Go to `File` > `Load Project` and load the included *.IBB* project file inside the `tools` folder.
  17. Now go to `Input` > `Advanced`, then click `Show Disc Layout Editor`.
  18. Navigate to the folder where you extracted all the RB2 disc contents into.
  19. Insert the following files & folders **in the exact order as listed here**:
      - SLUS_218.00 (might be SLES_xxx.xx if PAL)
      - SYSTEM.CNF
      - GEN/ (the new one you made, not the one from the driginal disc!)
      - IOP/
  20. Wait for it to finish, then patch the ISO with `DiscPatcher.exe`, with the `Master Disc` option ticked.
  21. **YOU ARE DONE, GO PLAY THE GAME.**
