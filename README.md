# workflow

`workflow` is my personal workflow tooling project: small utilities that help me
automate and standardize my day-to-day developer workflow.

The main interface is `wk`, a CLI that smooths friction around nix, direnv, vcs, etc.
git worktrees.

## Primary tool: `wk`

`wk` is a workflow orchestrator. It wraps common commands and codifies small
opinions so I can type less and make fewer mistakes.

Initial scope includes:
- `wk run` — shorthand for `nix run nixpkgs#<pkg>`
- `wk env ...` — direnv + env-file plumbing (Pattern A)
- `wk wt ...` — worktree/workspace helpers (opt-in env bootstrap)
- later: `wk system`, `wk home`, `wk shell`

## What belongs in this repo

Tools belong in this repo if they:
1) are part of my daily workflow, and
2) benefit from sharing conventions/config/state with `wk`.

This repo is not a dumping ground for unrelated scripts.

## Releases

This project uses small, frequent releases with 1–2 "user-facing" features per
release. See:
- `ROADMAP.md`
- `RELEASE_CHECKLIST.md`
- `CHANGELOG.md`
