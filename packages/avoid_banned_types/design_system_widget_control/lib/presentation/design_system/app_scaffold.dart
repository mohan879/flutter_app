// ✅ GOOD: Design system can define the raw Scaffold wrapper
import 'package:flutter/material.dart';

/// AppScaffold wraps raw Scaffold with error boundary, analytics, etc.
class AppScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;

  const AppScaffold({super.key, required this.body, this.appBar});

  @override
  Widget build(BuildContext context) {
    // Design system folder is excluded from the rule
    return Scaffold(appBar: appBar, body: body);
  }
}
