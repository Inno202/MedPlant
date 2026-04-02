import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medplant/constants/app_colors.dart';
import 'core/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MedPlant',
      debugShowCheckedModeBanner: false,

      // ✅ THIS is correct for GoRouter
      routerConfig: AppRouter.router,

      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme().copyWith(
          titleLarge: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          titleMedium: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}