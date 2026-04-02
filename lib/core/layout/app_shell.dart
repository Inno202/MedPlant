import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medplant/constants/app_colors.dart';

class AppShell extends StatelessWidget {
  final Widget child;
  final String location;

  const AppShell({super.key, required this.child, required this.location});

  int _getIndex(String location) {
    if (location.startsWith('/home')) return 0;
    if (location.startsWith('/viewreports')) return 1;
    if (location.startsWith('/predictions')) return 2;
    if (location.startsWith('/profile')) return 3;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _getIndex(location);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryDark,
        title: const Text("MedPlants", style: TextStyle(color: Colors.white)),
      ),
      drawer: _buildDrawer(context),
      body: child,
      bottomNavigationBar: _premiumNav(context, currentIndex),
    );
  }

  // 🔥 PREMIUM NAV
  Widget _premiumNav(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(context, Icons.home, "Home", 0, "/home", index),
            _navItem(context, Icons.description, "Reports", 1, "/viewreports", index),
            _navItem(context, Icons.auto_awesome, "Predictions", 2, "/predictions", index),
            _navItem(context, Icons.person, "Profile", 3, "/profile", index),
          ],
        ),
      ),
    );
  }

  Widget _navItem(
    BuildContext context,
    IconData icon,
    String label,
    int i,
    String route,
    int currentIndex,
  ) {
    final isActive = i == currentIndex;

    return GestureDetector(
      onTap: () {
        if (!location.startsWith(route)) {
          context.go(route);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isActive ? AppColors.primary : Colors.grey,
            ),
            if (isActive) ...[
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }

  // 🔥 DRAWER
  Widget _buildDrawer(BuildContext context) {
    Widget navItem(String title, IconData icon, String route) {
      final isActive = location.startsWith(route);

      return ListTile(
        leading: Icon(
          icon,
          color: isActive ? AppColors.primary : Colors.grey,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isActive ? AppColors.primary : Colors.black87,
          ),
        ),
        onTap: () {
          if (!location.startsWith(route)) {
            context.go(route);
          }
          Navigator.pop(context);
        },
      );
    }

    return Drawer(
      child: Column(
        children: [
          // 🔥 PREMIUM HEADER
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primaryDark, AppColors.primary],
              ),
            ),
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 35, color: AppColors.primary),
                ),
                SizedBox(height: 10),
                Text(
                  "Themba Mthembu",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Observer",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // 🔥 NAV ITEMS
          navItem("Home", Icons.home, "/home"),
          navItem("Reports", Icons.description, "/viewreports"),
          navItem("Predictions", Icons.auto_awesome, "/predictions"),
          navItem("Profile", Icons.person, "/profile"),

          const Spacer(),

          // 🔥 DIVIDER
          const Divider(),

          // 🔥 LOGOUT
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text(
              "Logout",
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              Navigator.pop(context);
              Future.microtask(() {
                if (context.mounted) {
                  context.go('/login');
                }
              });
            },
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}