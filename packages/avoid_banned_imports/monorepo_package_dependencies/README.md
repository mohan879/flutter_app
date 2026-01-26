# Monorepo Package Dependencies Example

Demonstrates controlling package dependencies in a monorepo structure.

## Rule Configuration

- Core packages cannot depend on feature or app packages
- Feature packages cannot depend on other features or apps

## Violations

- `packages/core/lib/bad_logger.dart` - imports feature package ❌
- `packages/feature_auth/lib/bad_auth_service.dart` - imports another feature ❌

## Run

```bash
dcm analyze packages
```
