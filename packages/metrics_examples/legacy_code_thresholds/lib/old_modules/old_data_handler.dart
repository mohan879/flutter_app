/// Old modules code with relaxed threshold (40)
/// Same complexity level as legacy code

class OldDataHandler {
  String handle(int a, int b, int c, int d, int e, int f, int g, int h) {
    if (a > 10) {
      if (b > 5) {
        if (c > 3) {
          if (d > 2) {
            if (e > 1) {
              if (f > 0) {
                if (g > -1) {
                  if (h > -2) {
                    return 'deep';
                  } else {
                    return 'h-fail';
                  }
                } else if (g == -1) {
                  return 'g-edge';
                } else {
                  return 'g-fail';
                }
              } else {
                return 'f-fail';
              }
            } else {
              return 'e-fail';
            }
          } else if (d == 2) {
            return 'd-edge';
          } else {
            return 'd-fail';
          }
        } else {
          return 'c-fail';
        }
      } else {
        return 'b-fail';
      }
    } else {
      return 'a-fail';
    }
  }
}
