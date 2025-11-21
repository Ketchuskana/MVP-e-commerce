import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_flutter/data/models/cart_item.dart';
import 'app_router.dart';
import 'storage/hive_adapters.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();
  registerHiveAdapters();
  await Hive.openBox<CartItem>('cart');
  //await Hive.openBox('cart');
  await Hive.openBox('orders');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _router = createRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ShopFlutter',
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
