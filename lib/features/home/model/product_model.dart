class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final int stock;
  final String category;
  final String? image;
  final String brand;
  final bool isDiscounted;
  final int discountPercent;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.category,
    required this.image,
    required this.brand,
    required this.isDiscounted,
    required this.discountPercent,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      price: (json["price"] as num).toDouble(),
      stock: json["stock"],
      category: json["category"],
      image: json["image"],
      brand: json["brand"] ?? "",
      isDiscounted: json["isDiscounted"] ?? false,
      discountPercent: json["discountPercent"] ?? 0,
    );
  }
}
