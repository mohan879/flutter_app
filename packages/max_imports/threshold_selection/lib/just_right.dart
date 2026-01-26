// This file has exactly 10 imports - AT the threshold, so it PASSES
// No violation expected

import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

/// A widget that is at the import threshold limit.
/// Consider refactoring before adding more imports.
class AtThresholdWidget extends StatefulWidget {
  const AtThresholdWidget({super.key});

  @override
  State<AtThresholdWidget> createState() => _AtThresholdWidgetState();
}

class _AtThresholdWidgetState extends State<AtThresholdWidget> {
  final _queue = Queue<String>();
  final _random = Random();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _queue.add('Item ${_random.nextInt(100)}');
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (kDebugMode) {
      final encoded = jsonEncode({'copied': text});
      print('Clipboard: $encoded');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('At Threshold')),
      child: Material(
        child: ListView.builder(
          itemCount: _queue.length,
          itemBuilder: (context, index) {
            final item = _queue.elementAt(index);
            return ListTile(
              title: Text(item),
              onTap: () => _copyToClipboard(item),
            );
          },
        ),
      ),
    );
  }
}
