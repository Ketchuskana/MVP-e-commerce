import 'package:hive/hive.dart';
import '../../data/models/product_model.dart';
import '../../data/models/cart_item.dart';

class CartService {
  static Box<CartItem> get box => Hive.box<CartItem>('cart');

  static void add(ProductModel product, int qty) {
    final existingKey = box.keys.firstWhere(
      (k) => box.get(k)!.productId == product.id,
      orElse: () => null,
    );

    if (existingKey != null) {
      final existing = box.get(existingKey)!;
      existing.quantity += qty;
      existing.save();
    } else {
      box.add(CartItem(productId: product.id, quantity: qty));
    }
  }

  static void remove(int productId) {
    final key = box.keys.firstWhere(
      (k) => box.get(k)!.productId == productId,
      orElse: () => null,
    );
    if (key != null) box.delete(key);
  }

  static List<CartItem> get items => box.values.toList();

  static double total(List<ProductModel> catalog) {
    double sum = 0;
    for (var item in items) {
      final p = catalog.firstWhere((e) => e.id == item.productId);
      sum += p.price * item.quantity;
    }
    return sum;
  }

  static void clear() => box.clear();
}
