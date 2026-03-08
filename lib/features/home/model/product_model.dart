import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class ProductModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final double price;
  @HiveField(4)
  final int stock;
  @HiveField(5)
  final String category;
  @HiveField(6)
  final String? image;
  @HiveField(7)
  final String brand;
  @HiveField(8)
  final bool isDiscounted;
  @HiveField(9)
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

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "price": price,
      "stock": stock,
      "category": category,
      "image": image,
      "brand": brand,
      "isDiscounted": isDiscounted,
      "discountPercent": discountPercent,
    };
  }
}
