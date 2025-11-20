import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
      foregroundColor: Colors.deepPurple,
      side: const BorderSide(color: Colors.grey, width: 1),
    );
    return Scaffold(
      appBar: AppBar(title: Text("Settings Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bienvenue sur ma page home !"),

            SizedBox(height: 20), // petit espace

            ElevatedButton(onPressed: () {}, child: Text("Elevate Button")),

            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.deepPurple),
              onPressed: () {},
              child: Text('TextButton'),
            ),

            OutlinedButton(
              style: outlineButtonStyle,
              onPressed: () {},
              child: Text('OutlineButton'),
            ),

            ElevatedButton.icon(onPressed: () {}, label: const Text("+")),
          ],
        ),
      ),
    );
  }
}
