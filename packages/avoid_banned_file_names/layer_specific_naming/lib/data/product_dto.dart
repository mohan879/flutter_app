// ✅ Correct - DTO belongs in data layer
class ProductDto {
  final String id;
  final String name;
  final double price;

  ProductDto({required this.id, required this.name, required this.price});

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'price': price};
}
