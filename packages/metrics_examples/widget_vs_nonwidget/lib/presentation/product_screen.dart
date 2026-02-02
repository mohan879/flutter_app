import 'package:flutter/material.dart';

/// Presentation code with relaxed thresholds (20 for cyclomatic, 6 for nesting)
class ProductScreen extends StatelessWidget {
  final bool isLoading;
  final bool hasError;
  final String? errorMessage;
  final List<String> products;
  final bool isLoggedIn;
  final bool isPremium;

  const ProductScreen({
    super.key,
    required this.isLoading,
    required this.hasError,
    this.errorMessage,
    required this.products,
    required this.isLoggedIn,
    required this.isPremium,
  });

  @override
  Widget build(BuildContext context) {
    // Same complexity level as domain code, but allowed here
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (hasError) {
      if (errorMessage != null) {
        if (errorMessage!.contains('network')) {
          if (isLoggedIn) {
            // Deep nesting - allowed with threshold 6
            return Center(
              child: Column(
                children: [
                  const Icon(Icons.wifi_off),
                  Text(errorMessage!),
                  ElevatedButton(onPressed: () {}, child: const Text('Retry')),
                ],
              ),
            );
          } else {
            return const Center(child: Text('Please login'));
          }
        } else {
          return Center(child: Text(errorMessage!));
        }
      } else {
        return const Center(child: Text('Unknown error'));
      }
    }

    if (products.isEmpty) {
      if (isLoggedIn) {
        if (isPremium) {
          return const Center(child: Text('Premium: No products yet'));
        } else {
          return const Center(child: Text('No products available'));
        }
      } else {
        return const Center(child: Text('Login to see products'));
      }
    }

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) => ListTile(title: Text(products[index])),
    );
  }
}
