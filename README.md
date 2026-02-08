# RaidLogAuto

A lightweight World of Warcraft addon that automatically enables combat logging when you enter a raid and disables it when you leave.

## Features

- **Automatic Combat Logging**: Starts logging when entering a raid instance, stops when leaving
- **Multi-Version Support**: Works on Retail, Classic Era, TBC Anniversary, and Cataclysm Classic
- **Mythic+ Support** (Retail only): Optional setting to also log Mythic+ dungeons
- **Lightweight**: Minimal performance impact
- **Configurable**: Simple slash commands to customize behavior

## Installation

1. Download from [CurseForge](https://www.curseforge.com/wow/addons/raidlogauto), [Wago](https://addons.wago.io), or [WoWInterface](https://www.wowinterface.com)
2. Extract to your `World of Warcraft/_retail_/Interface/AddOns/` folder (or the appropriate game version folder)
3. Restart WoW or `/reload`

## Usage

The addon works automatically - just install and forget! Combat logging will be enabled whenever you enter a raid instance.

### Slash Commands

| Command | Description |
|---------|-------------|
| `/rla` | Show current status |
| `/rla on` | Enable the addon |
| `/rla off` | Disable the addon |
| `/rla toggle` | Toggle addon on/off |
| `/rla mythic` | Toggle Mythic+ logging (Retail only) |
| `/rla silent` | Toggle chat messages on/off |
| `/rla help` | Show help |

## Log File Location

Combat logs are saved to:
- **Windows**: `World of Warcraft\_retail_\Logs\WoWCombatLog.txt`
- **macOS**: `World of Warcraft/_retail_/Logs/WoWCombatLog.txt`

Upload your logs to [Warcraft Logs](https://www.warcraftlogs.com/) for analysis!

## Configuration

Settings are saved per-character. Available options:

- **enabled**: Master toggle (default: on)
- **mythicPlus**: Log Mythic+ dungeons - Retail only (default: off)
- **printMessages**: Show status messages in chat (default: on)

## Release Setup (For Developers)

This addon uses the [BigWigsMods packager](https://github.com/BigWigsMods/packager) for automated releases.

### To release to CurseForge, Wago, and WoWInterface:

1. Update the project IDs in `RaidLogAuto.toc`:
   - `X-Curse-Project-ID`: Your CurseForge project ID
   - `X-WoWI-ID`: Your WoWInterface addon ID
   - `X-Wago-ID`: Your Wago project ID

2. Add these secrets to your GitHub repository:
   - `CF_API_KEY`: [CurseForge API token](https://wow.curseforge.com/account/api-tokens)
   - `WOWI_API_TOKEN`: [WoWInterface API token](https://www.wowinterface.com/downloads/filecpl.php?action=apitokens)
   - `WAGO_API_TOKEN`: [Wago API token](https://addons.wago.io/account/apikeys)

3. Create an annotated tag to trigger a release:
   ```bash
   git tag -a v1.0.0 -m "Initial release"
   git push origin v1.0.0
   ```

The GitHub Action will automatically build and upload to all platforms.

## License

MIT License - see LICENSE file for details.

## Contributing

Issues and pull requests welcome on [GitHub](https://github.com/Xerrion/RaidLogAuto)!
