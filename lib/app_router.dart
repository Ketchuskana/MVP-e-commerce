import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'features/auth/auth_service.dart';
import 'features/auth/login_page.dart';
import 'features/auth/register_page.dart';
import 'features/catalog/catalog_page.dart';
import 'features/product_detail/product_page.dart';
import 'features/cart/cart_page.dart';
import 'features/checkout/checkout_page.dart';
import 'features/orders/orders_page.dart';

GoRouter createRouter() {
  final auth = AuthService();

  return GoRouter(
    initialLocation: '/catalog',
    refreshListenable: auth,
    redirect: (context, state) {
      final loggedIn = auth.isLoggedIn;
      final loggingIn = state.uri.toString() == "/login" ||
          state.uri.toString() == "/register";

      if (!loggedIn && !loggingIn) return "/login";
      if (loggedIn && loggingIn) return "/catalog";
      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (_, __) => LoginPage()),
      GoRoute(path: '/register', builder: (_, __) => RegisterPage()),
      GoRoute(path: '/catalog', builder: (_, __) => CatalogPage()),
      GoRoute(
        path: '/product/:id',
        builder: (_, state) => ProductPage(
          productId: state.pathParameters['id']!,
        ),
      ),
      GoRoute(path: '/cart', builder: (_, __) => CartPage()),
      GoRoute(path: '/checkout', builder: (_, __) => CheckoutPage()),
      GoRoute(path: '/orders', builder: (_, __) => OrdersPage()),
    ],
  );
}
