// Simulated Flutter widget types

class Widget {}

class VoidCallback {}

class ElevatedButton extends Widget {
  ElevatedButton({required this.onPressed, required this.child});
  final dynamic onPressed;
  final Widget child;
}

class TextButton extends Widget {
  TextButton({required this.onPressed, required this.child});
  final dynamic onPressed;
  final Widget child;
}

class TextField extends Widget {
  TextField({this.decoration, this.controller});
  final dynamic decoration;
  final dynamic controller;
}

class Text extends Widget {
  Text(this.data, {this.style});
  final String data;
  final dynamic style;
}

class Image extends Widget {
  Image();

  static Widget network(String url, {dynamic fit, dynamic errorBuilder}) {
    return Image();
  }
}
