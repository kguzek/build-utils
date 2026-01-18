# Build Utils

A Quality of Life Factorio mod that enhances the building experience with automatic ghost item management.

## Overview

Build Utils provides seamless automation for managing ghost items when building in Factorio. It's designed to work with the vanilla setting **"Pick ghost items if no items are available"** to create a smoother, more intuitive building workflow.

## Features

### 1. Automatic Ghost Swap on Pickup

When you pick up an item from the ground while holding its ghost in your cursor, the mod automatically swaps the ghost for the real item. This eliminates the need to manually switch items when collecting resources while building.

**Example:** You're placing inserters but run out. You pick up an inserter from the ground, and the mod instantly swaps your cursor from the ghost inserter to the real one.

### 2. Automatic Ghost Select on Depletion

When you run out of an item while placing it, the mod automatically selects the ghost version of that item. This allows you to continue planning your build without interruption.

**Example:** You're placing belts and run out. The mod automatically switches your cursor to a belt ghost so you can continue laying out your design.

## Settings

Both features can be individually enabled or disabled in the mod settings (per-user runtime settings):

| Setting                                        | Default  | Description                                                                   |
| ---------------------------------------------- | -------- | ----------------------------------------------------------------------------- |
| **Enable automatic ghost swap on pickup**      | Enabled  | Automatically swaps ghost to real item when you pick up items from the ground |
| **Enable automatic ghost select on depletion** | Disabled | Automatically selects ghost when you run out of an item while building        |

## Installation

### In-game (recommended)

Use the mod menu in-game to find Build Utils and press `install`.

### Mod portal

1. Download the mod from the [Factorio Mod Portal](https://mods.factorio.com/mod/build-utils)
2. Place the zip file in the `mods` folder inside your [Factorio user data directory](https://wiki.factorio.com/Application_directory#Locations)
3. Enable the mod in-game

### From source

There is an installation shell script included for convenience in case you want to install from source (useful when modifying the mod code).
Simply set the `FACTORIO_PATH` environment variable (or create a file named `.env` in the `build-utils` folder with a path like `FACTORIO_PATH=~/.factorio`), and run the `install.sh` file from the repository folder.

```sh
cd build-utils
./install.sh
```

Instead of using the installation script, it may also be sufficient to simply clone the repository into the mods folder directly.

## How It Works

The mod uses two event handlers:

- **`on_player_main_inventory_changed`**: Detects when items are added to your inventory and swaps ghost items in your cursor with real items if available
- **`on_built_entity`**: Detects when you place an entity and automatically selects its ghost if you run out

## Use Cases

- **Rapid Construction:** Build continuously without worrying about running out of items
- **Blueprint Implementation:** Seamlessly transition between placing real items and ghosts
- **Inventory Management:** Pick up items from the ground without disrupting your building flow
- **Construction Planning:** Run out of items and keep planning without manual ghost selection

## License

Mod created by [Konrad Guzek](https://github.com/kguzek). Thumbnail image & README file generated using AI.
Licensed under MIT – see the [LICENSE](LICENSE) file for details.

## Compatibility

This mod is designed to enhance the vanilla building experience and should be compatible with most other mods. It specifically complements the vanilla setting **"Pick ghost items if no items are available"**.
