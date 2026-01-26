// Simulated Flutter types for demonstration
class BuildContext {}

class MaterialPageRoute<T> {
  MaterialPageRoute({required this.builder});
  final dynamic Function(BuildContext) builder;
}

class Widget {}

class SnackBar {
  SnackBar({required this.content});
  final Widget content;
}

class Text extends Widget {
  Text(this.text);
  final String text;
}

// Simulated Navigator
class Navigator {
  static void push(BuildContext context, dynamic route) {}
  static void pushNamed(BuildContext context, String name) {}
  static void pop(BuildContext context) {}
}

// Simulated showDialog
Future<T?> showDialog<T>({
  required BuildContext context,
  required dynamic Function(BuildContext) builder,
}) async {
  return null;
}

// Simulated showModalBottomSheet
Future<T?> showModalBottomSheet<T>({
  required BuildContext context,
  required dynamic Function(BuildContext) builder,
}) async {
  return null;
}

// Simulated ScaffoldMessenger
class ScaffoldMessengerState {
  void showSnackBar(SnackBar snackBar) {}
}

class ScaffoldMessenger {
  static ScaffoldMessengerState of(BuildContext context) {
    return ScaffoldMessengerState();
  }
}
