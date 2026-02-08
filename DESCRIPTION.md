# RaidLogAuto

**Never forget to enable combat logging again!**

RaidLogAuto automatically enables combat logging when you enter a raid instance and disables it when you leave. No more missed logs, no more manual `/combatlog` commands.

## Features

- **Fully Automatic** - Combat logging starts when you enter a raid, stops when you leave
- **Zero Configuration** - Install and forget, it just works
- **Lightweight** - Minimal memory footprint, no performance impact
- **Multi-Version Support** - Works on Retail, Classic Era, TBC Anniversary, and Cataclysm Classic
- **Mythic+ Support** - Optional setting to also log Mythic+ dungeons (Retail only)
- **Smart Detection** - Uses zone change events for reliable instance detection
- **Chat Notifications** - Know exactly when logging starts and stops (can be disabled)

## Why Use This?

If you upload logs to [Warcraft Logs](https://www.warcraftlogs.com/) or [WoW Analyzer](https://wowanalyzer.com/), you know the pain of realizing mid-raid that you forgot to enable combat logging. RaidLogAuto solves this by handling it automatically every single time.

## Commands

| Command | Description |
|---------|-------------|
| `/rla` | Show current status |
| `/rla on` | Enable the addon |
| `/rla off` | Disable the addon |
| `/rla toggle` | Toggle on/off |
| `/rla mythic` | Toggle Mythic+ logging (Retail) |
| `/rla silent` | Toggle chat notifications |

## Log File Location

Your combat logs are saved to:
```
World of Warcraft/_retail_/Logs/WoWCombatLog.txt
```
(Replace `_retail_` with `_classic_era_`, `_classic_`, or `_anniversary_` for other versions)

## Feedback & Support

Found a bug or have a suggestion? Please open an issue on [GitHub](https://github.com/Xerrion/RaidLogAuto)!
