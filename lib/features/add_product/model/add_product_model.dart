class AddProductModel {
  String name;
  String category;
  String description;
  String price;
  String brand;
  String discount;
  String stock;
  String tag;
  String status;
  String weight;
  String color;
  String dimension;

  AddProductModel({
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.brand,
    required this.discount,
    required this.stock,
    required this.tag,
    required this.status,
    required this.weight,
    required this.color,
    required this.dimension,
  });

  Map<String, dynamic> toJson() {
    final int discountVal = int.tryParse(discount) ?? 0;
    return {
      "name": name,
      "description": description,
      "price": double.tryParse(price) ?? 0,
      "stock": int.tryParse(stock) ?? 0,
      "category": category,
      "brand": brand,
      "isDiscounted": discountVal > 0,
      "discountPercent": discountVal,
      "tags": tag
          .split(',')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList(),
      "weight": double.tryParse(weight) ?? 0,
      "dimensions": dimension,
      "colors": color
          .split(',')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList(),
    };
  }
}
