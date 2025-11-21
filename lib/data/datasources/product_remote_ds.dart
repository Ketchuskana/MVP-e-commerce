import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductRemoteDataSource {
  final bool useLocalMock;
  ProductRemoteDataSource({this.useLocalMock = true});

  Future<List<ProductModel>> fetchProducts() async {
    if (useLocalMock) {
      final data = await rootBundle.loadString('assets/mock/products.json');
      final List list = json.decode(data);
      return list.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      final res =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      final List list = json.decode(res.body);
      return list.map((e) => ProductModel.fromJson(e)).toList();
    }
  }

  Future<ProductModel> fetchProduct(int id) async {
    if (useLocalMock) {
      final all = await fetchProducts();
      return all.firstWhere((p) => p.id == id);
    } else {
      final res =
          await http.get(Uri.parse('https://fakestoreapi.com/products/$id'));
      return ProductModel.fromJson(json.decode(res.body));
    }
  }
}
