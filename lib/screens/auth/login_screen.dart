// lib/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '/constants/app_colors.dart';
import '/widgets/custom_text_field.dart';
import '/widgets/primary_button.dart';
import '/widgets/outlined_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleLogin(BuildContext context) {
    final username = usernameController.text;
    final password = passwordController.text;

    if (username == 'demo' && password == 'demo123') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login successful! Redirecting...')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid username or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.accentBg,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: size.width * 0.85,
            constraints: const BoxConstraints(maxWidth: 480),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              children: [
                // Header
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  decoration: BoxDecoration(
                    color: AppColors.accentBg,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: AppColors.white,
                        child: const FaIcon(FontAwesomeIcons.seedling, size: 32, color: AppColors.primary),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Welcome Back',
                        style: GoogleFonts.montserrat(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryDark,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '... sign in to continue ...',
                        style: GoogleFonts.dancingScript(
                  color: AppColors.primarySoft,
                  fontSize: 18,
                ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      CustomTextField(
                        label: 'Username',
                        hint: 'Enter your username',
                        icon: Icons.person,
                        controller: usernameController,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        label: 'Password',
                        hint: 'Enter your password',
                        icon: Icons.lock,
                        obscureText: true,
                        controller: passwordController,
                      ),
                      const SizedBox(height: 24),
                      PrimaryButton(
                        text: 'Login',
                        icon: Icons.login,
                        onPressed: () async {
  // simulate login
  await Future.delayed(const Duration(milliseconds: 300));

  if (context.mounted) {
    context.go('/home');
  }
}
                      ),
                      const SizedBox(height: 12),
                      OutlinedButtonWidget(
                        text: 'Create New Account',
                        icon: Icons.person_add,
                        onPressed: () {
                          
                          context.push('/register');
                        
                        },
                      ),
                      // const SizedBox(height: 16),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text('Don\'t have an account? ', style: TextStyle(color: AppColors.textSecondary)),
                      //     GestureDetector(
                      //       onTap: () {
                      //         ScaffoldMessenger.of(context).showSnackBar(
                      //           const SnackBar(content: Text('Redirecting to Registration')),
                                
                      //         );  context.go('/register');
                      //       },
                      //       child: Text(
                      //         'Register here',
                      //         style: TextStyle(color: AppColors.primaryDark, fontWeight: FontWeight.bold),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Forgot Password functionality')),
                          );
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: AppColors.primaryDark, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}