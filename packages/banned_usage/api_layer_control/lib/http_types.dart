// Simulated HTTP types

class Response<T> {
  final T data;
  Response(this.data);
}

class Dio {
  Future<Response<dynamic>> get(String path) async {
    return Response({'data': 'response'});
  }

  Future<Response<dynamic>> post(String path, {dynamic data}) async {
    return Response({'data': 'response'});
  }
}

// Safe JSON utilities
dynamic jsonDecode(String source) {
  // Simulated
  return {};
}

String jsonEncode(Object? object) {
  // Simulated
  return '{}';
}
