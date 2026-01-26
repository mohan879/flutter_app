// This file has only 5 imports - well under the threshold
// No violation expected - this is ideal

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// A focused widget with minimal imports.
/// This is the ideal pattern - small, focused files with few dependencies.
class MinimalImportsWidget extends StatefulWidget {
  const MinimalImportsWidget({super.key});

  @override
  State<MinimalImportsWidget> createState() => _MinimalImportsWidgetState();
}

class _MinimalImportsWidgetState extends State<MinimalImportsWidget> {
  String _text = '';
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onTextChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      setState(() {
        _text = value;
      });
      if (kDebugMode) {
        print('Text updated: $_text');
      }
    });
  }

  Future<void> _copyText() async {
    await Clipboard.setData(ClipboardData(text: _text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Minimal Imports')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: _onTextChanged,
              decoration: const InputDecoration(labelText: 'Enter text'),
            ),
            const SizedBox(height: 16),
            Text('Current: $_text'),
            ElevatedButton(onPressed: _copyText, child: const Text('Copy')),
          ],
        ),
      ),
    );
  }
}
