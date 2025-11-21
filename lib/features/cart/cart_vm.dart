import 'package:hive/hive.dart';
import '../../data/models/cart_item.dart';

class CartService {
  final box = Hive.box('cart');

  List<CartItem> get items => List<CartItem>.from(box.values);

  void add(int productId) {
    final existing = box.get(productId);
    if (existing != null) {
      existing.quantity++;
      box.put(productId, existing);
    } else {
      box.put(productId, CartItem(productId: productId, quantity: 1));
    }
  }

  void remove(int productId) {
    box.delete(productId);
  }

  void clear() {
    box.clear();
  }

  double get total => items.fold(
      0, (sum, i) => sum + i.quantity * 10); // remplacer 10 par price via repo
}
