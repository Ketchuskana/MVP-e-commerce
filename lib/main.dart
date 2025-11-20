import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app_router.dart';
import 'services/firebase_initializer.dart';
import 'storage/hive_adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  registerHiveAdapters(); // définis tes adapters pour Product/Cart/Order
  await Hive.openBox('cart');
  await Hive.openBox('orders');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _router = createRouter(); // défini dans app_router.dart
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ShopFlutter',
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
