import 'package:flutter/foundation.dart';
import '../../data/models/product_model.dart';
import '../../data/datasources/product_remote_ds.dart';

class CatalogViewModel extends ChangeNotifier {
  final ProductRemoteDataSource ds;
  List<ProductModel> products = [];
  bool loading = false;
  String? error;

  CatalogViewModel({required this.ds});

  Future<void> load() async {
    loading = true;
    error = null;
    notifyListeners();
    try {
      products = await ds.fetchProducts();
    } catch (e) {
      error = e.toString();
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  List<ProductModel> search(String q) {
    if (q.isEmpty) return products;
    final lower = q.toLowerCase();
    return products
        .where((p) =>
            p.title.toLowerCase().contains(lower) ||
            p.category.toLowerCase().contains(lower))
        .toList();
  }
}
