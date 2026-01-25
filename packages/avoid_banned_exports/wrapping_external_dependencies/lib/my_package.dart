// ✅ Valid exports - your own abstractions
export 'src/api_client.dart';

// ❌ Entry 1: HTTP client types should not be in public API
export 'package:dio/dio.dart'; // expect lint: leaks Dio
export 'package:http/http.dart'; // expect lint: leaks http
export 'package:retrofit/retrofit.dart'; // expect lint: leaks retrofit

// ❌ Entry 2: Database libraries are implementation details
export 'package:sqflite/sqflite.dart'; // expect lint: leaks sqflite
export 'package:hive/hive.dart'; // expect lint: leaks hive
export 'package:drift/drift.dart'; // expect lint: leaks drift
export 'package:isar/isar.dart'; // expect lint: leaks isar
