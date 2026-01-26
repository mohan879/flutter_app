// ✅ AFTER: Using barrel file - PASSES max-imports rule (threshold: 5)
// Only 5 imports total - uses barrel file for entities

import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Single barrel import replaces 4 individual imports!
import '../entities/entities.dart';

/// Widget with reduced imports - 5 total imports passes threshold of 5.
/// Uses barrel file to consolidate entity imports.
class ReducedImportsWidget extends StatefulWidget {
  const ReducedImportsWidget({super.key});

  @override
  State<ReducedImportsWidget> createState() => _ReducedImportsWidgetState();
}

class _ReducedImportsWidgetState extends State<ReducedImportsWidget> {
  User? _user;
  Session? _session;
  Token? _token;
  bool _isLoading = false;
  Timer? _refreshTimer;

  @override
  void initState() {
    super.initState();
    _setupTokenRefresh();
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    super.dispose();
  }

  void _setupTokenRefresh() {
    _refreshTimer = Timer.periodic(const Duration(minutes: 5), (_) {
      if (_token?.needsRefresh ?? false) {
        _refreshToken();
      }
    });
  }

  Future<void> _login() async {
    setState(() => _isLoading = true);

    final credentials = Credentials(username: 'user', password: 'password123');

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _user = const User(id: '1', name: 'John', email: 'john@example.com');
      _session = Session(
        sessionId: 'sess_123',
        createdAt: DateTime.now(),
        expiresAt: DateTime.now().add(const Duration(hours: 24)),
      );
      _token = Token(
        accessToken: 'access_xyz',
        refreshToken: 'refresh_xyz',
        expiresAt: DateTime.now().add(const Duration(hours: 1)),
      );
      _isLoading = false;
    });

    if (kDebugMode) {
      print(jsonEncode({'user': _user?.name, 'valid': credentials.isValid}));
    }
  }

  Future<void> _refreshToken() async {
    if (kDebugMode) {
      print('Refreshing token...');
    }
    // Token refresh logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reduced Imports')),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_user != null) Text('Welcome, ${_user!.name}'),
                  if (_session != null)
                    Text(
                      'Session: ${_session!.isExpired ? "Expired" : "Active"}',
                    ),
                  ElevatedButton(
                    onPressed: _user == null ? _login : null,
                    child: const Text('Login'),
                  ),
                ],
              ),
      ),
    );
  }
}
