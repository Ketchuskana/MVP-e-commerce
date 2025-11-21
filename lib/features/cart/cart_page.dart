import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../data/models/product_model.dart';
import '../../data/models/cart_item.dart';
import 'cart_service.dart';
import 'package:go_router/go_router.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<CartItem>('cart');

    return Scaffold(
      appBar: AppBar(title: const Text('Panier')),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, Box<CartItem> itemsBox, _) {
          final items = itemsBox.values.toList();
          if (items.isEmpty) {
            return const Center(child: Text('Votre panier est vide'));
          }
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, i) {
              final item = items[i];
              return ListTile(
                title: Text('Produit ID: ${item.productId}'),
                subtitle: Text('Quantité: ${item.quantity}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => itemsBox.deleteAt(i),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, Box<CartItem> itemsBox, _) {
          if (itemsBox.isEmpty) return const SizedBox.shrink();

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Simulation de confirmation de commande
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Commande confirmée !')),
                );

                // On vide le panier
                itemsBox.clear();

                // Retour à la page catalogue
                context.go('/');
              },
              child: const Text('Confirmer la commande'),
            ),
          );
        },
      ),
    );
  }
}
