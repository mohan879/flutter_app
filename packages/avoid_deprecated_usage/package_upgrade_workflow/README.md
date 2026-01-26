# Package Upgrade Workflow Example

Demonstrates workflow for handling new deprecations after package upgrades.

## Workflow

```bash
# 1. Snapshot current state
dcm init --baseline

# 2. Upgrade packages
flutter pub upgrade --major-versions

# 3. See new deprecations
dcm analyze

# 4. Update baseline (track new issues)
dcm init --baseline

# 5. Fix incrementally, update baseline after each sprint
```

## Scenario

This example simulates a scenario where:

- `lib/pre_upgrade.dart` - Code written before upgrade (would be in baseline)
- `lib/post_upgrade.dart` - Code showing new deprecations after package upgrade

## Run Analysis

```bash
dcm analyze lib
```
