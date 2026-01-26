// Simulated types

class Widget {}

class VoidCallback {}

class ElevatedButton extends Widget {
  ElevatedButton({required this.onPressed, required this.child});
  final dynamic onPressed;
  final Widget child;
}

class Text extends Widget {
  Text(this.data);
  final String data;
}

class Response<T> {
  final T data;
  Response(this.data);
}

class Dio {
  Future<Response<dynamic>> get(String path) async => Response({});
  Future<Response<dynamic>> post(String path, {dynamic data}) async =>
      Response({});
}
