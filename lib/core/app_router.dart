import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medplant/core/layout/app_shell.dart';
import 'package:medplant/models/plant_model.dart';
import 'package:medplant/screens/auth/login_screen.dart';
import 'package:medplant/screens/auth/register_screen.dart';
import 'package:medplant/screens/field_manager/approve_reports_screen.dart';
import 'package:medplant/screens/user/plant_detail_screen.dart';
import 'package:medplant/screens/user/predictions_screen.dart';
import 'package:medplant/screens/user/user_home_screen.dart';
import 'package:medplant/screens/user/add_report_screen.dart';
import 'package:medplant/screens/user/view_reports_screen.dart';


class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: [

      // 🔐 AUTH (NO SHELL)
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),

      // 🌐 MAIN APP (WITH NAV BAR + DRAWER)
      ShellRoute(
        builder: (context, state, child) {
          return AppShell(child: child);
        },
        routes: [

          GoRoute(
            path: '/home',
            builder: (context, state) => UserHomeScreen(),
          ),

          GoRoute(
            path: '/viewreports',
            builder: (context, state) => const ViewReportsScreen(),
          ),

          GoRoute(
            path: '/predictions',
            builder: (context, state) => const PredictionsScreen(),
          ),

          GoRoute(
            path: '/profile',
            builder: (context, state) => const Placeholder(),
          ),
        ],
      ),

      // 🔥 OUTSIDE SHELL (STACK SCREENS)
      GoRoute(
        path: '/plantdetail',
        builder: (context, state) {
          final plant = state.extra as PlantModel;
          return PlantDetailScreen(plant: plant);
        },
      ),

      GoRoute(
        path: '/addreport',
        builder: (context, state) => AddReportScreen(),
      ),

      GoRoute(
        path: '/approvereports',
        builder: (context, state) => const ApproveReportsScreen(),
      ),
    ],
  );
}