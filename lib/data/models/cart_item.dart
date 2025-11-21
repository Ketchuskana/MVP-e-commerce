import 'package:hive/hive.dart';

part 'cart_item.g.dart';

@HiveType(typeId: 1)
class CartItem {
  @HiveField(0)
  final int productId;

  @HiveField(1)
  int quantity;

  CartItem({required this.productId, required this.quantity});
}
