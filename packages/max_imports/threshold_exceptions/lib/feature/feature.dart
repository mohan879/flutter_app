// ❌ This file VIOLATES max-imports rule (threshold: 5)
// No ignore comment - demonstrates violation
// LINT: The number of imports in this file exceeds the configured threshold.

import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../services/api_service.dart';
import '../services/auth_service.dart';
import '../services/analytics_service.dart';

/// A feature screen that has too many imports without an exception.
/// This file should be refactored to reduce imports or split functionality.
class FeatureScreen extends StatefulWidget {
  const FeatureScreen({super.key});

  @override
  State<FeatureScreen> createState() => _FeatureScreenState();
}

class _FeatureScreenState extends State<FeatureScreen> {
  late final ApiService _apiService;
  late final AuthService _authService;
  late final AnalyticsService _analytics;
  bool _isLoading = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _apiService = ApiServiceImpl();
    _authService = AuthServiceImpl();
    _analytics = AnalyticsServiceImpl();
    _timer = Timer.periodic(const Duration(seconds: 30), (_) {
      _refreshData();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _refreshData() async {
    setState(() => _isLoading = true);

    final data = await _apiService.get('/data');
    if (kDebugMode) {
      print(jsonEncode(data));
    }

    _analytics.logEvent('data_refreshed', {'source': 'timer'});

    setState(() => _isLoading = false);
  }

  Future<void> _login() async {
    final success = await _authService.login('user@example.com', 'password123');
    if (success) {
      _analytics.logEvent('login_success', null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feature')),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: _login, child: const Text('Login')),
                  ElevatedButton(
                    onPressed: _refreshData,
                    child: const Text('Refresh'),
                  ),
                ],
              ),
      ),
    );
  }
}
