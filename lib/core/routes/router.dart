import 'package:flutter/material.dart';
import 'package:get_help/presentation/auth/signup/signup_role_screen.dart';
import 'package:get_help/presentation/auth/signup/signup_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SignupRole();
      },
      // routes: <RouteBase>[
      //   GoRoute(
      //     path: 'details',
      //     builder: (BuildContext context, GoRouterState state) {
      //       return const ();
      //     },
      //   ),
      // ],
    ),
    GoRoute(
      path: '/signin',
      builder: (BuildContext context, GoRouterState state) {
        return const SigninScreen();
      },
    )
  ],
);
