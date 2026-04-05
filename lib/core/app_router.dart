import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medplant/screens/about_us.dart';
import 'package:medplant/screens/admin_contact_message_screen.dart';
import 'package:medplant/screens/contact_us.dart';
import 'package:medplant/screens/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:medplant/core/layout/app_shell.dart';
import 'package:medplant/models/plant_model.dart';
import 'package:medplant/providers/navigation_provider.dart';
import 'package:medplant/screens/auth/login_screen.dart';
import 'package:medplant/screens/auth/register_screen.dart';
import 'package:medplant/screens/user/user_home_screen.dart';
import 'package:medplant/screens/user/view_reports_screen.dart';
import 'package:medplant/screens/user/predictions_screen.dart';
import 'package:medplant/screens/user/plant_detail_screen.dart';
import 'package:medplant/screens/user/add_report_screen.dart';
import 'package:medplant/screens/field_manager/approve_reports_screen.dart';
import 'package:medplant/screens/admin/admin_dashboard.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/home',
    routes: [

      // 🔐 AUTH (no shell)
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
    final navProvider = Provider.of<NavigationProvider>(context);
    navProvider.setRoute(state.matchedLocation);
    return AppShell(child: child);
  },
  routes: [
    // USER ROUTES
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

    // 🔥 ADMIN ROUTES (ADD THESE)
    GoRoute(
      path: '/admin/dashboard',
      builder: (context, state) =>  AdminDashboardScreen(),
    ),
    GoRoute(
      path: '/admin/users',
      builder: (context, state) => const Placeholder(),
    ),
    GoRoute(
      path: '/admin/system',
      builder: (context, state) => const Placeholder(),
    ),

    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
),

      // 🔥 STACK SCREENS OUTSIDE SHELL
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
      GoRoute(
      path: '/about',
      builder: (context, state) => const AboutScreen(),
    ),GoRoute(
      path: '/contactmessages',
      builder: (context, state) =>  AdminContactMessagesScreen(messages: [],),
    ),
    GoRoute(
      path: '/contact',
      builder: (context, state) =>  ContactScreen(),
    ),
    
    ],
  );
}