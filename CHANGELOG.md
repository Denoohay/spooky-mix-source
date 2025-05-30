# Changelog
All notable changes will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [2.0.2] - 2025-05-30

### Added

- New version of High (Spooky Mix) by Thrick
- 3 new options
	- Default Player - Choose the Playable Character that will be selected by default when first opening Freeplay.
	- Spooky Menu - Switch between using Spooky Mix's or FNF's menu themes.
	- Spooky Shaders - If disabled, Spooky Mix stages will not use shaders or blend modes.
- Pico and Nene now have a house in Blazin' (Spooky Mix)
- Punkman has a new animation in Guns (Spooky Mix)
- New easter egg in Week 7 (Spooky Mix)
- New easter egg in Week 5 (Spooky Mix)
- CHANGELOG and README files to the GitHub repo

### Changed

- New menu background art
- Small updates to Moloch's Week 6 sprites
- Adjusted the lighting on Moloch in Thorns (Spooky Mix)
- Dilly Dally now loops on the Blazin' (Spooky Mix) opening comic
- Darnell (Spooky Mix) lyrics have been pushed back to show up after your turn so it won't lag when you're trying to hit notes (still haven't figured out how to completely stop the lag)

### Fixed

- Moloch will now always swipe in the correct direction to attack the tankmen in Stress (Spooky Mix)
- M.I.L.F (Spooky Mix) now has unique easy and normal charts
- Punkman's face flicker now loops properly
- Script errors no longer pop up when pressing F5 to refresh the game on Funkin' v0.6.4

### Removed

Anything related to or made by SacredSky has been removed/replaced due to controversy



## [2.0.1] - 2025-05-18

### Changed

- Weekend 1 songs and Winter Horrorland are now unlocked by default
- Spooky Kids Game Over Retry sound is now the original sound from the V1 executable version instead of the shortened version
- Dancing Ghosts in Week 3 are now layered in front of Moloch
- Arrow keys can now also be used to skip Blazin's opening comic
- Updated Thrick's design in Blazin'
- HUD is now hidden at the end of Fresh since the rating was covering DD's face
- You can now skip the cutscene at the start of Stress (Spooky Mix)
- LeGooey has been added to Blazin's art credits
- Updated "alewito" to "alwk" in credits
- Added Thrick back to the Spooky Mix Team credits

### Fixed

- Adjusted Blazin's chart so that the hit animations only play at the appropriate times
- M.I.L.F (Spooky Mix) now has charting on Easy and Normal (currently just Hard but slower, will be getting updated)

### Removed

- Removed Philly Nice (Spooky Mix) From Alt Instrumentals ([thanks to GabyStarStudiosOfficial for the issue report](https://github.com/Denoohay/SpookyMix/issues/2))



## [2.0.0] - 2025-05-17
VOLUME 2 UPDATE

### Added

- 8 NEW SPOOKY MIX SONGS
	- Philly Nice
	- Satin Panties
	- Senpai
	- Roses
	- Thorns
	- Guns
	- Stress
	- Blazin'
- 5 UPDATED SPOOKY MIX SONGS
	- High
	- M.I.L.F
	- Darnell
	- Lit Up
	- 2hot
- 3 New Results Screen animations with 2 new themes
- New Week 3 Spooky Mix background
- Week 4 spooky revamp (new background, new Mommy Mearest sprites)
- New Christmas Parents sprites in Spooky Mix Week 5
- New Mall Santa sprite in Spooky Mix Week 5
- Week 7 spooky revamp (new background, new Tankman sprites)
- New stickers in the Spooky Mix pack
- Daddy Dearest has a new animation in Fresh (Spooky Mix)

### Changed

- Zombie Pico has new sprites
- Weekend 1 Spooky Mix visual revamp
- Updates to Vampire Daddy Dearest's sprites
- Week 5 Spooky Mix visual upgrade
- Week 2 Spooky Mix visual upgrade
- Weekend 1 Spooky Mix visual revamp
- Tutorial Spooky Mix visual upgrade
- Moloch has new health icons
- Monster's songs no longer require you to beat South (Spooky Mix) or Eggnog (Spooky Mix) to unlock them
- You can no longer press notes while the HUD is hidden or when the screen is completely black
- Improved Eggnog (Spooky Mix)'s camera events and characters no longer rapidly bop
- Mod is now Mod Pack only (no executable/source code version)



## [1.1.5] - 2025-04-26
(Mod Pack only)
### Changed

- Spooky Kids sticker transition now only shows up in Spooky Mix songs rather than replacing Boyfriend's sticker set
- New alternative Spooky Kids sticker packs (Attic and Ooga Booga)
- "albumTitleOffsets" in Spooky Mix Vol. 1's json file is now used to define the offsets of the album title instead of being defined in the Freeplay script (which caused "albumTitleOffsets" for any album to be completely ignored)
- Now requires Friday Night Funkin' v0.6.3

### Fixed

- Pause Menu artwork credits will go away when playing a song that doesn't have a credit listed in the metadata after previously playing a song that did have it listed (before it would get stuck listing the art credits for the last song you played)



## [1.1.4] - 2025-04-09
(Mod Pack only)

### Added

- Modded song variations now AUTOMATICALLY get added to the list of alt instrumentals for any variation (works across multiple mods). Note: Certain mods may disable alt instrumentals for certain songs. (let me know if you encounter any issues relating to this change to alt instrumentals)
- Ugh (Spooky Mix) can now be played with Alt Instrumentals and as an Alt Instrumental



## [1.1.3] - 2025-04-06
(Mod Pack only)
### Fixed

- South and Eggnog will now only transition to Monster (Spooky Mix) or Winter Horrorland (Spooky Mix) when playing on the Spooky Mixes rather than any variation



## [1.1.2] - 2025-04-05
(Mod Pack only)

### Changed

- Updated credits to include LeGooey under Pixel Art and Programming

### Fixed

- A script error no longer pops up when opening the pause menu on certain songs

### Removed

- Removed an intro text



## [1.1.1] - 2025-04-05

### Changed [MOD PACK]

- Now uses JSON Patching which allows for better compatibility with other playable character mods that also use JSON Patching
- Beating a song now unlocks all Alt Instrumentals for it that are listed in the metadata (Works automatically with other playable character mods as long as those mods don't override the song scripts)
- Default mixes are now available as Alt Instrumentals for Pico Mixes (including songs from Pistop 2)
- Pause Menu "Artwork" credits are now defined in the song metadata (as "modArt") rather than in a giant chain of if statements in the Pause Menu script (Works automatically for any song if "modArt" is included in the song's metadata)

### Fixed [MOD PACK]

- Cocoa (Pico Mix) and Darnell Erect are no longer missing in Freeplay
- Tankman's ugh animation is no longer cancelled by his notes in Ugh (Spooky Mix)

### Changed [EXECUTABLE]

- Updated Adjust Color shader to look the same as it does in Funkin' v0.6
- Rim light character shader has been added to Week 7's Erect Stage



## [1.1.0] - 2025-05-01
"Small Update" (April Fools Update)

### Added

- Brand new song in Story Mode
- Added Cocoa (Pico Mix) as an Alt Instrumental

### Changed

- Spooky Kids have a new nametag design on the Character Select Screen
- Ugh (Spooky Mix) now uses Week 7's Erect Background
- Raised the volume of Blammed (Spooky Mix)
- Raised the volume of Fresh (Spooky Mix)

### Changed [MOD PACK]
- Updated for Friday Night Funkin v0.6
- Eggnog (Spooky Mix) is no longer available as an Alt Instrumental and no longer can be played with Alt Instrumentals



## [1.0.2] - 2025-01-06
Spooky Mix Mod Pack release

### Added

- Added an "old" icon for the Spooky Kids (press 9 in-game to switch to it)
- New "Play Sound" chart event

### Changed

- Updated Skid and Pump's idle faces in Week 2
- Skid and Pump's miss poses are now properly colored and shaded in Week 2
- Adjustments to Vampire Daddy Dearest's idle
- Good results screen music now has the same start delay time as base game
- Tutorial (Spooky Mix) song preview in Freeplay now loops properly
- New camera chart events in Tutorial (Spooky Mix), [thanks LeGooey]
- When downscroll is selected, subtitles will be at the top of the screen
- Chart events are now soft modded
- Lyrics chart event has more customization options in the chart editor

### Fixed

- Adjusting input offsets no longer crashes the game ([thanks to Honton129 for the issue report](https://github.com/Denoohay/SpookyMix/issues/1))



## [1.0.1] - 2024-11-09

### Added

- Alternate instrumentals (BF, Erect, and Pico) are now available for certain songs after beating them

### Changed

- Adjustments to Moloch's sprites
- Adjustments to Vampire Daddy Dearest's sprites
- Skid now has correct proportions in week 2
- Pump's cheer animation in week 2 is slightly larger
- Adjustments to loss results animation
- Adjustments to freeplay idle animation
- Unlocking a hidden song should land you back on the correct selection after you exit to freeplay no matter what freeplay filter you selected the song from
- "IT'S THE SPOOKY BEFORE CHRISTMAS" line is no longer charted in Cocoa as it was catching people off guard. Instead, the screen fades to black and shows subtitles
- Hidden songs are now displayed as "???" in the pause menu until the screen is fully revealed
- You can no longer press notes or hit reset on the opening of a hidden song
- Scroll speed has been adjusted for Ugh
- Scroll speed has been adjusted for High
- Added in normal difficulty chart for High as it was using the hard chart before
- Tweaked difficulty values for certain songs in freeplay
- Changing song selection in freeplay immediately after reciving a new rank will play the correct song preview instead of a preview of the song you just got a rank for

### Fixed

- Game Over animation now consistently centers with the screen and is no longer affected by color shaders on certain stages
- Fixed a bug causing the game to start with no volume for certain people (requires more testing as no team members have been able to recreate this issue. Please let me know if you still encounter this)
- Fixed a bug causing save data for base game to be reset for certain people. Still make a backup of your save just in case. (requires more testing as no team members have been able to recreate this issue. Please let me know if you still encounter this)
- Transitioning from the results screen to a hidden song now mutes the audio properly



## [1.0.0] - 2024-10-30
FNF: SPOOKY MIX release