import 'package:hive/hive.dart';
import '../data/models/cart_item.dart';

void registerHiveAdapters() {
  Hive.registerAdapter(CartItemAdapter());
}
