# RaidLogAuto AGENTS.md

Deviates from workspace conventions: no Ace3, no shared `ns`, no AceDB.

## Version-Specific Files

| File | TOC Directive | Game Version |
|------|---------------|--------------|
| `RaidLogAuto_Retail.lua` | `## Interface` | Retail (raids + Mythic+) |
| `RaidLogAuto_Mists.lua` | `## Interface-Mists` | MoP Classic (raids + Mythic+) |
| `RaidLogAuto_TBC.lua` | `## Interface-BCC` | TBC Anniversary (raids) |
| `RaidLogAuto_Cata.lua` | `## Interface-Cata` | Cataclysm Classic (raids) |
| `RaidLogAuto_Classic.lua` | `## Interface-Classic` | Classic Era (raids) |

## Namespace Pattern

Use `local ADDON_NAME, _ = ...` - the shared `ns` table is intentionally discarded. Each version-specific file is fully self-contained; do not factor logic into a shared module.

## SavedVariables Defaults Merge

No AceDB. Defaults are merged manually in the `ADDON_LOADED` handler:

```lua
local defaults = {
    enabled = true,
    raidOnly = true,
    mythicPlus = false,      -- Retail/Mists only
    printMessages = true,
}

for key, value in pairs(defaults) do
    if RaidLogAutoDB[key] == nil then
        RaidLogAutoDB[key] = value
    end
end
```

## Known Gotchas

- `RaidLogAuto.lua` is **deprecated** and excluded from packaging - do not edit it.

## AI Code of Conduct

Applies to every AI agent working in this repo. Human-facing version: [CONTRIBUTING.md](CONTRIBUTING.md#ai-code-of-conduct).

- **Disclose.** State in the PR description which tool was used and how much of the change it produced.
- **Human review.** A human must review, understand, and be able to explain every line you submit. Never submit unreviewed output.
- **Verify.** Run `luacheck .` and test in-game before submitting. Never claim a check passed without running it.
- **No fabrication.** Do not invent WoW API behaviour. Verify against [warcraft.wiki.gg](https://warcraft.wiki.gg) and Blizzard's FrameXML source.
- **No spam.** No bulk or drive-by AI-generated issues or PRs. One scoped change per PR, linked to an issue.
- **Licensing.** Contributors are responsible for licensing. Do not paste code of unknown origin.
- **Agent conduct.**
  - Follow this file.
  - Never push to `master`.
  - Never merge release-please PRs (`chore(master): release X.Y.Z`); the owner merges those.
  - Do not touch secrets or workflow permissions without explicit approval.
- **PR titles** must be conventional commits (`feat:`, `fix(scope):`, `chore:` ...). Squash merges use the PR title as the commit message, and release-please derives versions from it.
