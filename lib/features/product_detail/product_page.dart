import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../data/models/product_model.dart';
import '../cart/cart_service.dart';
import 'product_vm.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class ProductPage extends StatefulWidget {
  final String productId;
  const ProductPage({super.key, required this.productId});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late ProductViewModel vm;
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    vm = ProductViewModel(productId: widget.productId);
    vm.load();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: vm,
      child: Consumer<ProductViewModel>(
        builder: (context, vm, _) {
          if (vm.loading)
            return const Center(child: CircularProgressIndicator());
          if (vm.error != null)
            return Center(child: Text('Error: ${vm.error}'));

          final p = vm.product!;
          return Scaffold(
            appBar: AppBar(
              title: Text(p.title),
              actions: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () => context.go('/cart'),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Image.network(p.thumbnail, height: 200, fit: BoxFit.cover),
                  const SizedBox(height: 16),
                  Text(p.title, style: const TextStyle(fontSize: 22)),
                  const SizedBox(height: 8),
                  Text('${p.price} €', style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 16),
                  Text(p.description),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            if (quantity > 1) setState(() => quantity--);
                          },
                          icon: const Icon(Icons.remove)),
                      Text(quantity.toString(),
                          style: const TextStyle(fontSize: 18)),
                      IconButton(
                          onPressed: () => setState(() => quantity++),
                          icon: const Icon(Icons.add)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      CartService.add(p, quantity);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('${p.title} ajouté au panier')));
                    },
                    child: const Text('Ajouter au panier'),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
