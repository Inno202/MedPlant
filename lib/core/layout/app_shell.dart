import 'package:flutter/material.dart';
import 'package:medplant/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:medplant/constants/app_colors.dart';
import 'package:medplant/providers/navigation_provider.dart';
import 'package:go_router/go_router.dart';

class AppShell extends StatelessWidget {
  final Widget child;

  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryDark,
        title: const Text("MedPlants", style: TextStyle(color: Colors.white)),
      ),

      drawer: _buildDrawer(context, navProvider),

      body: child,

      bottomNavigationBar: _premiumNav(context, navProvider),
    );
  }

  Widget _premiumNav(BuildContext context, NavigationProvider navProvider) {
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
            _navItem(context, Icons.home, "Home", 0, navProvider),
            _navItem(context, Icons.description, "Reports", 1, navProvider),
            _navItem(context, Icons.auto_awesome, "Predictions", 2, navProvider),
            _navItem(context, Icons.person, "Profile", 3, navProvider),
          ],
        ),
      ),
    );
  }

  Widget _navItem(
      BuildContext context, IconData icon, String label, int index, NavigationProvider navProvider) {
    final isActive = navProvider.currentIndex == index;

    return GestureDetector(
      onTap: () {
        navProvider.setIndex(index);
        context.go(navProvider.routes[index]);
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
            Icon(icon, color: isActive ? AppColors.primary : Colors.grey),
            if (isActive) ...[
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600),
              )
            ],
          ],
        ),
      ),
    );
  }

Widget _buildDrawer(BuildContext context, NavigationProvider navProvider) {
  final userProvider = Provider.of<UserProvider>(context);
  final role = userProvider.role;

  Widget navItem(String title, IconData icon, int index) {
    final isActive = navProvider.currentIndex == index;
    return ListTile(
      leading: Icon(icon, color: isActive ? AppColors.primary : Colors.grey),
      title: Text(title,
          style: TextStyle(color: isActive ? AppColors.primary : Colors.black87)),
      onTap: () {
        navProvider.setIndex(index);
        context.go(navProvider.routes[index]);
        Navigator.pop(context);
      },
    );
  }

  // Determine bottom button text and action
  String bottomButtonText = role == null ? "Login" : "Logout";
  VoidCallback bottomButtonAction = () {
    Navigator.pop(context);
    if (role == null) {
      context.go('/login');
    } else {
      // log out
      userProvider.setRole(null); // Reset role
      context.go('/login');
    }
  };

  return Drawer(
    child: Column(
      children: [
        // Show user info only if logged in
        if (role != null)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [AppColors.primaryDark, AppColors.primary]),
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 35, color: AppColors.primary),
                ),
                const SizedBox(height: 10),
                Text(
                  "Themba Mthembu",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  role.name == "observer"
                      ? "Observer"
                      : role.name == "fieldManager"
                          ? "Field Manager"
                          : role.name == "admin"
                              ? "Admin"
                              : "Unknown Role",
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        const SizedBox(height: 10),
        navItem("Home", Icons.home, 0),
        navItem("Reports", Icons.description, 1),
        navItem("Predictions", Icons.auto_awesome, 2),
        navItem("Profile", Icons.person, 3),
        const Spacer(),
        const Divider(),
        ListTile(
          leading: Icon(
              role == null ? Icons.login : Icons.logout,
              color: role == null ? AppColors.primary : Colors.red),
          title: Text(
            bottomButtonText,
            style: TextStyle(
                color: role == null ? AppColors.primary : Colors.red),
          ),
          onTap: bottomButtonAction,
        ),
        const SizedBox(height: 10),
      ],
    ),
  );
}
}