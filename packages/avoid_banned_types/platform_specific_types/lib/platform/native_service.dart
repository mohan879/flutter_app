// ✅ GOOD: Platform channels in dedicated platform folder
import 'package:flutter/services.dart';

class NativeService {
  static const MethodChannel _channel = MethodChannel('my_channel');
  static const EventChannel _eventChannel = EventChannel('my_events');

  Future<String> getData() async {
    return await _channel.invokeMethod('getData');
  }

  Stream<dynamic> get events => _eventChannel.receiveBroadcastStream();
}
