import '../types.dart';

// ✅ Good: Design system can use raw ElevatedButton

class DSButton {
  static Widget primary({required String label, required dynamic onPressed}) {
    // Allowed in design_system folder (excluded from ban)
    return ElevatedButton(onPressed: onPressed, child: Text(label));
  }

  static Widget secondary({required String label, required dynamic onPressed}) {
    // Also allowed
    return ElevatedButton(onPressed: onPressed, child: Text(label));
  }
}
