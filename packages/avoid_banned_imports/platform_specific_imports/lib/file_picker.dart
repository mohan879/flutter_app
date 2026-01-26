// ✅ CORRECT: Abstract interface with conditional export
export 'file_picker_stub.dart'
    if (dart.library.io) 'file_picker_mobile.dart'
    if (dart.library.html) 'file_picker_web.dart';

/// Abstract file picker interface
abstract class FilePicker {
  Future<String?> pickFile();
}
