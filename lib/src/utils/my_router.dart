import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_shopping/src/pages/home.dart';
import 'package:simple_shopping/src/pages/cart.dart';
import 'package:simple_shopping/src/pages/payment.dart';
import 'package:simple_shopping/src/utils/commons.dart';

final GoRouter customRouter = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const MyHomePage(title: Commons.appTitle),
    ),
    GoRoute(
      path: '/cart',
      builder: (BuildContext context, GoRouterState state) => const Cart(),
    ),
    GoRoute(
      path: '/payment',
      builder: (BuildContext context, GoRouterState state) => const MakePayment(),
    ),
  ],
);
