// ❌ Bad: Unvalidated URL parsing

class UrlHandler {
  void openLink(String userInput) {
    // LINT: Use SafeUri.parse() with validation to prevent injection attacks.
    final uri = Uri.parse(userInput);
    print('Opening: $uri');
  }

  void navigateToDeepLink(String link) {
    // LINT: Use SafeUri.parse() with validation to prevent injection attacks.
    final uri = Uri.parse(link);
    // ... navigation logic
  }

  String buildUrl(String path, Map<String, String> params) {
    // LINT: Use SafeUri.parse() with validation to prevent injection attacks.
    final base = Uri.parse('https://api.example.com');
    return base.replace(path: path, queryParameters: params).toString();
  }
}
