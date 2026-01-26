/// Abstract analytics service interface.
abstract class AnalyticsService {
  void logEvent(String name, Map<String, dynamic>? params);
  void setUserId(String? userId);
}

/// Analytics service implementation.
class AnalyticsServiceImpl implements AnalyticsService {
  String? _userId;

  @override
  void logEvent(String name, Map<String, dynamic>? params) {
    // In real app, send to analytics provider
    print('Analytics: $name ${params ?? {}}');
  }

  @override
  void setUserId(String? userId) {
    _userId = userId;
    print('Analytics user: $_userId');
  }
}
