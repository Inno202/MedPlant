// widgets/info_grid.dart
import 'package:flutter/material.dart';
import 'info_card.dart';

class InfoGrid extends StatelessWidget {
  const InfoGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    int columns = 1; // default → mobile
    if (screenWidth >= 600) columns = 2;
    if (screenWidth >= 900) columns = 3;

    // total horizontal padding between cards
    final spacing = 16.0;
    final totalSpacing = spacing * (columns - 1);

    // card width: evenly distribute remaining space
    final cardWidth = (screenWidth - totalSpacing - 16 * 2) / columns;
    // 16*2 is horizontal padding on the grid container

    return Center(
      child: Wrap(
        spacing: spacing,
        runSpacing: spacing,
        alignment: WrapAlignment.start, // center leftover space
        children: [
          SizedBox(
            width: cardWidth,
            child: const InfoCard(
              title: "Plants Monitored",
              icon: Icons.eco,
              type: "check",
              items: [
                "Agapanthus Africanus",
                "Knowltonia Capensis",
                "Lessertia frutescens",
                "And many more..."
              ],
            ),
          ),
          SizedBox(
            width: cardWidth,
            child: const InfoCard(
              title: "Contributors to Medicinal Plants Degradation",
              icon: Icons.warning,
              type: "times",
              items: [
                "Land Use Change",
                "Pollution",
                "Climate Change",
                "Overexploitation"
              ],
            ),
          ),
          SizedBox(
            width: cardWidth,
            child: const InfoCard(
              title: "Indigenous Knowledge Integration",
              icon: Icons.psychology,
              type: "indigenous",
              items: [
                "Community Indicators",
                "Local Observations",
                "Traditional Practices",
                "Oral Histories"
              ],
            ),
          ),
        ],
      ),
    );
  }
}