abstract class IAnalyticsRepository {
  Future<void> logEvent(String name, {Map<String, dynamic>? parameters});
  Future<void> logScreenView(String screenName);
}
