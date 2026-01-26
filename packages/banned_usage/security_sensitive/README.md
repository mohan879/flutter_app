# Security-Sensitive Operations Example

Demonstrates protecting security-sensitive areas of code.

## What This Example Shows

- Banning `SharedPreferences.setString` in auth/token files (use SecureStorage)
- Banning `print` in auth/password files (prevents credential logging)
- Warning on `Uri.parse` to use validated parsing

## Run Analysis

```bash
dcm analyze lib
```

## Security Considerations

| Area          | Risk               | Rule                               |
| ------------- | ------------------ | ---------------------------------- |
| Auth files    | Credential leakage | Ban `print`, require SecureStorage |
| Token storage | Token theft        | Require SecureStorage              |
| URL handling  | Injection attacks  | Validate URLs                      |

## Expected Violations

The files in auth-related folders contain security violations.
