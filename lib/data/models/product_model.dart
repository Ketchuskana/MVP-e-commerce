import 'package:hive/hive.dart';

part 'product_model.g.dart'; // Obligatoire pour Hive

@HiveType(typeId: 1) // Unique ID pour ce type
class ProductModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final double price;

  @HiveField(3)
  final String thumbnail;

  @HiveField(4)
  final List<String> images;

  @HiveField(5)
  final String description;

  @HiveField(6)
  final String category;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbnail,
    required this.images,
    required this.description,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
        title: json['title'] ?? '',
        price: (json['price'] as num).toDouble(),
        thumbnail: json['thumbnail'] ?? json['image'] ?? '',
        images: (json['images'] as List?)?.map((e) => e.toString()).toList() ??
            [json['image'] ?? ''],
        description: json['description'] ?? '',
        category: json['category'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'thumbnail': thumbnail,
        'images': images,
        'description': description,
        'category': category,
      };
}
