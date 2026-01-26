// ❌ Entity in data layer - should be in domain/
class ProductEntity {
  final String id;
  final String name;

  ProductEntity({required this.id, required this.name});
}
