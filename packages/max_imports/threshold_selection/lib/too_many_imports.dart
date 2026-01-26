// This file has 12 imports - VIOLATES max-imports rule (threshold: 10)
// LINT: The number of imports in this file exceeds the configured threshold.

import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

/// A widget that does too many things and imports too many dependencies.
/// This is a sign that the file should be split into smaller, focused files.
class KitchenSinkWidget extends StatefulWidget {
  const KitchenSinkWidget({super.key});

  @override
  State<KitchenSinkWidget> createState() => _KitchenSinkWidgetState();
}

class _KitchenSinkWidgetState extends State<KitchenSinkWidget> {
  final _queue = Queue<String>();
  final _random = Random();
  Timer? _timer;
  Uint8List? _data;

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

  Future<void> _loadData() async {
    final file = File('data.txt');
    if (await file.exists()) {
      _data = await file.readAsBytes();
      final decoded = utf8.decode(_data!);
      if (kDebugMode) {
        print('Loaded: $decoded');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _loadData,
      child: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Kitchen Sink'),
        ),
        child: Material(
          child: ListView.builder(
            itemCount: _queue.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(_queue.elementAt(index)));
            },
          ),
        ),
      ),
    );
  }
}
