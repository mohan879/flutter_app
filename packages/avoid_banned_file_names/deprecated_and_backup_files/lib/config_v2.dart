// ❌ Versioned file - keep one file and version in git
class ConfigV2 {
  final String apiUrl;
  final int timeout;

  ConfigV2({required this.apiUrl, this.timeout = 30});
}
