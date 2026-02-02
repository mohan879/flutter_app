/// New feature code with stricter threshold (15)
class UserService {
  String getUserStatus(
    int level,
    bool isActive,
    bool isPremium,
    String region,
    int points,
    bool hasSubscription,
    String tier,
    bool isVerified,
    bool hasMfa,
    String accountType,
    bool hasLoyalty,
  ) {
    // Intentionally complex to trigger cyclomatic-complexity violation at threshold 15
    if (level > 10) {
      if (isActive) {
        if (isPremium) {
          if (region == 'US') {
            if (points > 1000) {
              if (hasSubscription) {
                if (tier == 'gold') {
                  if (isVerified) {
                    if (hasMfa) {
                      if (accountType == 'business') {
                        if (hasLoyalty) {
                          return 'elite-business-mfa-loyalty';
                        } else {
                          return 'elite-business-mfa';
                        }
                      } else {
                        return 'elite-personal-mfa';
                      }
                    } else {
                      return 'elite-no-mfa';
                    }
                  } else {
                    return 'gold-unverified';
                  }
                } else if (tier == 'silver') {
                  return 'silver';
                } else if (tier == 'bronze') {
                  return 'bronze';
                } else {
                  return 'unknown-tier';
                }
              } else {
                return 'no-subscription';
              }
            } else {
              return 'low-points';
            }
          } else if (region == 'EU') {
            return 'eu-premium';
          } else if (region == 'APAC') {
            return 'apac-premium';
          } else {
            return 'other-region';
          }
        } else {
          return 'not-premium';
        }
      } else {
        return 'inactive';
      }
    } else {
      return 'low-level';
    }
  }
}
