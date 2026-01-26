// ❌ VIOLATION: Web file importing dart:io
import 'dart:io';

/// Web implementation that incorrectly uses dart:io
class FilePickerWeb {
  Future<String?> pickFile() async {
    // This won't work on web!
    final file = File('test.txt');
    return file.path;
  }
}
