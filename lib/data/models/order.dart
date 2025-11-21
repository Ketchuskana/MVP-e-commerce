import 'package:hive/hive.dart';
import 'cart_item.dart';

part 'order.g.dart';

@HiveType(typeId: 3)
class Order {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final List<CartItem> items;

  @HiveField(2)
  final double total;

  @HiveField(3)
  final DateTime createdAt;

  Order({
    required this.id,
    required this.items,
    required this.total,
    required this.createdAt,
  });
}
