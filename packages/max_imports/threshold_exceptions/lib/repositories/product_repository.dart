import '../services/api_service.dart';

/// Product entity.
class Product {
  final String id;
  final String name;
  final double price;

  const Product({required this.id, required this.name, required this.price});
}

/// Abstract product repository interface.
abstract class ProductRepository {
  Future<Product?> getProduct(String id);
  Future<List<Product>> getAllProducts();
}

/// Product repository implementation.
class ProductRepositoryImpl implements ProductRepository {
  final ApiService _apiService;

  ProductRepositoryImpl(this._apiService);

  @override
  Future<Product?> getProduct(String id) async {
    final response = await _apiService.get('/products/$id');
    if (response['status'] == 'success') {
      return Product(id: id, name: 'Product $id', price: 9.99);
    }
    return null;
  }

  @override
  Future<List<Product>> getAllProducts() async {
    await _apiService.get('/products');
    return [
      const Product(id: '1', name: 'Product 1', price: 9.99),
      const Product(id: '2', name: 'Product 2', price: 19.99),
    ];
  }
}
