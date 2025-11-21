import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mes commandes')),
      body: Center(child: Text('Liste des commandes ici')),
    );
  }
}
