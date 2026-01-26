// ❌ BEFORE: Many individual imports - VIOLATES max-imports rule (threshold: 5)
// LINT: The number of imports in this file exceeds the configured threshold.

import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Individual entity imports - 4 separate imports
import '../entities/user.dart';
import '../entities/session.dart';
import '../entities/credentials.dart';
import '../entities/token.dart';

/// Widget with verbose imports - 8 total imports exceeds threshold of 5.
/// This demonstrates the problem that barrel files solve.
class VerboseImportsWidget extends StatefulWidget {
  const VerboseImportsWidget({super.key});

  @override
  State<VerboseImportsWidget> createState() => _VerboseImportsWidgetState();
}

class _VerboseImportsWidgetState extends State<VerboseImportsWidget> {
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
      appBar: AppBar(title: const Text('Verbose Imports')),
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
