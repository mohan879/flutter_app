/// Authentication - critical code with strict threshold (10)

class AuthService {
  // Cannot suppress violations in auth code either
  bool authenticate(
    String username,
    String password,
    String? mfaCode,
    bool rememberDevice,
    String ipAddress,
    String userAgent,
    bool isTrustedDevice,
    int failedAttempts,
    bool isLocked,
    String sessionId,
    bool requiresMfa,
    String deviceFingerprint,
  ) {
    // Complex auth logic - will violate threshold 10
    if (isLocked) {
      return false;
    }

    if (failedAttempts > 5) {
      if (!isTrustedDevice) {
        if (requiresMfa) {
          if (mfaCode == null) {
            return false;
          } else if (mfaCode.length != 6) {
            return false;
          } else {
            // Verify MFA
            if (_verifyMfa(mfaCode)) {
              return true;
            } else {
              return false;
            }
          }
        } else {
          return false;
        }
      } else {
        return _verifyCredentials(username, password);
      }
    } else {
      if (requiresMfa && mfaCode != null) {
        return _verifyMfa(mfaCode);
      } else {
        return _verifyCredentials(username, password);
      }
    }
  }

  bool _verifyMfa(String code) => code == '123456';
  bool _verifyCredentials(String u, String p) => u.isNotEmpty && p.isNotEmpty;
}
