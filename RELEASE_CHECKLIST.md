# Release Checklist

This checklist exists to build release discipline.
Every release follows this process, even if it feels repetitive.

## Before tagging
- [ ] All planned features for this version are merged
- [ ] CLI help output updated (if needed)
- [ ] `--version` reports the correct version
- [ ] CHANGELOG.md updated
  - Added a section for this version
  - Clear list of user-facing changes
  - Breaking changes called out explicitly

## Versioning
- [ ] Version follows `v0.x.y`
- [ ] Version bump committed (if version is stored in code)

## Tagging
```bash
git tag -a vX.Y.Z -m "vX.Y.Z"
git push origin vX.Y.Z
```

- [ ] Tag pushed to origin

## CI
- [ ] CI passes on the tag
- [ ] Release artifacts generated (if applicable)

## GitHub Release
- [ ] GitHub Release created from tag
- [ ] Release notes added
  - Summary of changes
  - Upgrade notes (if needed)

 Artifacts attached (if applicable)

## After release
- [ ] ROADMAP.md updated (mark release as done)
- [ ] CHANGELOG.md new "Unreleased" section created
