// ❌ BAD: MethodChannel used outside lib/platform/
import 'package:flutter/services.dart';

class BadNativeService {
  // ❌ Violation: MethodChannel outside platform folder
  static const MethodChannel _channel = MethodChannel('my_channel');

  Future<String> getData() async {
    return await _channel.invokeMethod('getData');
  }
}
