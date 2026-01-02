# wk Roadmap

`wk` is a personal UX layer over Nix, git worktrees, and direnv.
The goal is to reduce daily friction while practicing a disciplined,
modern release process.

The project follows a **small, frequent release model**:
- 1–2 user-facing features per release
- tagged releases (`v0.x.y`)
- a changelog entry per release
- CI runs on every PR and tag

Breaking changes are expected during `0.x`, but are documented.

---

## v0.1.0 — First useful daily win
**Status:** planned

### Features
- `wk run <pkg> [-- args…]`
  - Expands to `nix run nixpkgs#<pkg> -- …`
  - If `<pkg>` contains `#`, pass through unchanged
- `wk env export direnv`
  - Prints shell-compatible `export KEY=VALUE` lines
  - Silent if no env file exists

### Non-goals
- No direnv integration yet
- No `.envrc` generation
- No config file

---

## v0.2.0 — Make Pattern A real
**Status:** planned

### Features
- `wk env init`
  - Creates repo-root `.envrc` stub
  - Detects `flake.nix` → `use flake`
  - Detects `shell.nix` → `use nix`
- `wk env allow`
  - Runs `direnv allow` at repo root

---

## v0.3.0 — Env file UX
**Status:** planned

### Features
- `wk env edit`
  - Opens `~/.config/wk/env.d/<repo>.env` in `$EDITOR`
  - Creates file and directory if missing
- Robust env file parsing
  - Handles quoting and whitespace safely
  - Emits correctly shell-escaped exports

---

## v0.4.0 — Worktrees (env friction only)
**Status:** planned

### Features
- `wk wt add <branch> [--env] [--allow]`
  - Wrapper over `git worktree add`
  - Optional env initialization
- `wk wt list`
  - Thin wrapper over `git worktree list`

### Non-goals
- No opinionated directory layout
- No automatic env init by default

---

## v0.5.0 — NixOS rebuild ergonomics
**Status:** planned

### Features
- `wk system switch`
- `wk system test`

### Notes
- Hostname auto-detected
- Flake path provided via `NX_FLAKE` env var

---

## v0.6.0 — Home Manager ergonomics
**Status:** planned

### Features
- `wk home switch`
- `wk home build`

---

## v0.7.0 — Dev shell entry
**Status:** planned

### Features
- `wk shell`
  - Enters default dev shell for repo
- `wk shell <name>`
  - Enters named dev shell

---

## v0.8.0 — Quality & confidence
**Status:** planned

### Features
- `wk doctor`
  - Checks presence of required tools (`nix`, `git`, `direnv`, etc.)
- Improved error messages and help output

---

## Out of scope (for now)
- Direnv replacement
- Secrets backends (sops/agenix/1Password)
- Cross-machine syncing
- Repo ID collision handling
- TUI

