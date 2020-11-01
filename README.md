# Glossy Goodness

Poor man's specular light shader for [Canvas](https://github.com/grondag/canvas) renderer (a fabric minecraft mod).

It works with sun light only. Block light does nothing.

Applies to:
- Block of iron
- Block of gold
- Block of diamond
- Block of emerald
- Block of netherite

But more can be added to the material maps as desired.

## Why?

Proper PBR support for Canvas is planned. This shader is for impatient people.

This shader is made to work on Canvas 1.0.1081. It won't work on Canvas 1.0.1033 or earlier. **It is not guaranteed to work either way.**

**If you would like to report a bug to Canvas, make sure it's not caused by this shader.** Easiest way is by removing this shader, restart the game, and try to reproduce the bug that way.

**When proper PBR/specular lights support is added to Canvas, please use those instead.** This applies whether you're using this shader pack for yourself or for making derivative work. 

## How-To

### Installation

If you're already using git, just clone the repo to your `.minecraft/resourcepacks/` folder.

If you want to download the code directly, click the green `Code` button on top of this page and select `Download ZIP`. Inside the ZIP is a folder that you will want to put in your `.minecraft/resourcepacks/` folder. Don't put the ZIP directly as it wouldn't work.

### Adding more blocks

Copy-paste any `.json` file in `/assets/minecraft/materialmaps/` and rename it to the block id of the block that you want to make shiny. You can look up block id in the [minecraft wiki](https://minecraft.gamepedia.com). Reload the resource pack for the change to take effect.
