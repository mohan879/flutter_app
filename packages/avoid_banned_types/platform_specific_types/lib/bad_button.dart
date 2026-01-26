// ❌ BAD: Cupertino widgets used outside _ios.dart file
import 'package:flutter/cupertino.dart';

class BadButton extends StatelessWidget {
  // ❌ Violation: CupertinoButton outside *_ios.dart file
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(onPressed: () {}, child: const Text('Click'));
  }
}

class BadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ❌ Violation: CupertinoPageScaffold outside *_ios.dart file
    return CupertinoPageScaffold(child: Center(child: Text('Hello')));
  }
}
