import 'package:flutter/material.dart';

class Calculatrice extends StatelessWidget {
  const Calculatrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculatrice Page")),
      body: Center(child: Text("Bienvenue sur ma page de Calculatrice !")),
    );
  }
}
