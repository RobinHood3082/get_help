import 'package:flutter/material.dart';
import 'package:get_help/presentation/auth/auth_state.dart';
import 'package:get_help/presentation/auth/signup/signup_role_screen.dart';
import 'package:get_help/presentation/auth/signup/signup_screen.dart';
import 'package:get_help/presentation/student/counseling/add_counseling_request_screen.dart';
import 'package:get_help/presentation/student/counseling/all_counseling_requests_screen.dart';
import 'package:get_help/presentation/student/dashboard/dashboard_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/all-counseling-requests',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const AuthState();
      },
    ),
    GoRoute(
      path: '/signin',
      builder: (BuildContext context, GoRouterState state) {
        return const SigninScreen();
      },
    ),
    GoRoute(
      path: '/s-dashboard',
      builder: (BuildContext context, GoRouterState state) {
        return const StudentDasboard();
      },
    ),
    GoRoute(
      path: '/add-counseling-request',
      builder: (BuildContext context, GoRouterState state) {
        return const AddCounselingRequestScreen();
      },
    ),
    GoRoute(
        path: '/all-counseling-requests',
        builder: (BuildContext context, GoRouterState state) {
          return const AllCounselingRequestsScreen();
        }),
  ],
);
