// ✅ CORRECT: Mobile implementation using dart:io
import 'dart:io';

/// Mobile implementation using dart:io
class FilePickerMobile {
  Future<String?> pickFile() async {
    final file = File('test.txt');
    return file.existsSync() ? file.path : null;
  }
}
