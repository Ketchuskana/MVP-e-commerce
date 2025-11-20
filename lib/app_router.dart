import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'features/auth/login_page.dart';
import 'features/catalog/catalog_page.dart';
import 'features/product_detail/product_page.dart';
import 'features/cart/cart_page.dart';
import 'features/checkout/checkout_page.dart';
import 'services/auth_service.dart';

GoRouter createRouter() {
  final authService = AuthService(); // singleton ou provider
  return GoRouter(
    initialLocation: '/catalog',
    refreshListenable: authService, // si AuthService extends ChangeNotifier
    redirect: (context, state) {
      final loggedIn = authService.isLoggedIn;
      final loggingIn = state.subloc == '/login';
      if (!loggedIn && !loggingIn) return '/login';
      if (loggedIn && loggingIn) return '/catalog';
      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (_, __) => LoginPage()),
      GoRoute(path: '/catalog', builder: (_, __) => CatalogPage()),
      GoRoute(
          path: '/product/:id',
          builder: (_, state) {
            final id = state.params['id']!;
            return ProductPage(productId: id);
          }),
      GoRoute(path: '/cart', builder: (_, __) => CartPage()),
      GoRoute(path: '/checkout', builder: (_, __) => CheckoutPage()),
      // optional orders
      GoRoute(path: '/orders', builder: (_, __) => OrdersPage()),
    ],
  );
}
