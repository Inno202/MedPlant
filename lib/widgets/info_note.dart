import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class InfoNote extends StatelessWidget {
  const InfoNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.accentBg,
        borderRadius: BorderRadius.circular(12),
        border: const Border(
          left: BorderSide(
            color: AppColors.primary,
            width: 5,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          InfoRow(
            icon: Icons.info,
            text:
                "Similarities are based on temperature patterns, seasonal cycles, and image recognition from community observations.",
          ),
          SizedBox(height: 10),
          InfoRow(
            icon: Icons.memory,
            text:
                "MSA from 3Bee: Multi-Spectral Analysis technology used for biodiversity monitoring.",
          ),
          SizedBox(height: 10),
          InfoRow(
            icon: Icons.psychology,
            text:
                "IK Integration: Predictions incorporate indigenous knowledge indicators from local communities.",
          ),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.primary, size: 18),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}