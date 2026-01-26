// ✅ Better approach - single config with runtime values
class AppConfig {
  final String apiUrl;
  final String apiKey;

  AppConfig({required this.apiUrl, required this.apiKey});

  // Use --dart-define or environment variables
  factory AppConfig.fromEnvironment() {
    return AppConfig(
      apiUrl: const String.fromEnvironment(
        'API_URL',
        defaultValue: 'https://api.example.com',
      ),
      apiKey: const String.fromEnvironment('API_KEY', defaultValue: ''),
    );
  }
}
