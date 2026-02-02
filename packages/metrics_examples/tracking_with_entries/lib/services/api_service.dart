/// Regular service - enforced threshold (15) applies here

import 'dart:async';

class ApiService {
  final StreamController<String> _controller = StreamController();

  String getStatus(int level, bool active, bool premium) {
    if (level > 10) {
      if (active) {
        if (premium) {
          return 'premium-active';
        }
        return 'active';
      }
      return 'inactive';
    }
    return 'low-level';
  }

  void dispose() {
    _controller.close();
  }
}
