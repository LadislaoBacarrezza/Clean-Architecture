import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// Importamos los barriles de los features
import 'package:pdp_feature/pdp_feature.dart';
import 'package:checkout_feature/checkout_feature.dart';

// Importamos el Service Locator
import 'injection_container.dart';

class AppRouter {
  static const String pdpPath = '/';
  static const String checkoutPath = '/checkout';

  static final GoRouter router = GoRouter(
    initialLocation: pdpPath,
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Ruta no encontrada: ${state.matchedLocation}')),
    ),
    routes: [
      GoRoute(
        path: pdpPath,
        name: 'pdp',
        builder: (context, state) {
          return BlocProvider(
            create: (_) => sl<PdpBloc>(),
            child: const PdpPage(),
          );
        },
      ),
      GoRoute(
        path: checkoutPath,
        name: 'checkout',
        builder: (context, state) {
          return BlocProvider(
            create: (_) => sl<CheckoutBloc>(),
            child: const CheckoutPage(),
          );
        },
      ),
    ],
  );
}
