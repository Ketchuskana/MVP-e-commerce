import 'package:flutter/foundation.dart';
import '../../data/models/product_model.dart';
import '../../data/datasources/product_remote_ds.dart';

class ProductViewModel extends ChangeNotifier {
  final String productId;
  final ProductRemoteDataSource ds =
      ProductRemoteDataSource(useLocalMock: true);

  ProductModel? product;
  bool loading = false;
  String? error;

  ProductViewModel({required this.productId});

  Future<void> load() async {
    loading = true;
    error = null;
    notifyListeners();
    try {
      product = await ds.fetchProduct(int.parse(productId));
    } catch (e) {
      error = e.toString();
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
