# Feature Module Isolation Example

Demonstrates keeping features isolated from each other in a feature-first
architecture.

## Rule Configuration

Each feature cannot import from other features - only from core/ and shared/.

## Violations

- `lib/features/auth/auth_service.dart` - imports from home feature ❌
- `lib/features/home/home_page.dart` - imports from auth feature ❌

## Run

```bash
dcm analyze lib
```
