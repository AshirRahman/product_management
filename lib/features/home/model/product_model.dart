import 'package:hive/hive.dart';

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

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 0;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{};
    for (int i = 0; i < numOfFields; i++) {
      fields[reader.readByte()] = reader.read();
    }
    return ProductModel(
      id: fields[0] as String,
      name: fields[1] as String,
      description: fields[2] as String,
      price: fields[3] as double,
      stock: fields[4] as int,
      category: fields[5] as String,
      image: fields[6] as String?,
      brand: fields[7] as String,
      isDiscounted: fields[8] as bool,
      discountPercent: fields[9] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.stock)
      ..writeByte(5)
      ..write(obj.category)
      ..writeByte(6)
      ..write(obj.image)
      ..writeByte(7)
      ..write(obj.brand)
      ..writeByte(8)
      ..write(obj.isDiscounted)
      ..writeByte(9)
      ..write(obj.discountPercent);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
