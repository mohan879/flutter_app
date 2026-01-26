// ✅ GOOD: Cupertino widgets in _ios.dart file
import 'package:flutter/cupertino.dart';

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(onPressed: () {}, child: const Text('Click'));
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(child: Center(child: Text('Hello iOS')));
  }
}
