import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          "https://images.unsplash.com/photo-1464226184884-fa280b87c399?w=1400",
          height: 250,
          width: double.infinity,
          fit: BoxFit.cover,
          
        ),

        // Overlay
        Container(
          height: 250,
          color: Colors.black.withOpacity(0.5),
        ),

        Positioned(
          left: 16,
          right: 16,
          top: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ Headline → Montserrat (or switch to Poppins if you choose it)
              Text(
                "Integrating Indigenous Knowledge and ICT Tools",
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  height: 1.3,
                ),
              ),

              const SizedBox(height: 12),

              // Optional subtitle (you had this in HTML)
              Text(
                "... the ITIKI Way ...",
                style: GoogleFonts.dancingScript(
                  color: Colors.white70,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 16),

              // ✅ Button styled like your web
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryDark,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Learn More",
                  style: GoogleFonts.montserrat(
                    color: AppColors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}