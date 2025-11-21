import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String productId;
  const ProductPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product $productId')),
      body: Center(child: Text('Détails du produit $productId')),
    );
  }
}
