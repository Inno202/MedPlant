import 'package:flutter/material.dart';
import 'package:medplant/constants/app_colors.dart';
import 'package:medplant/models/biodiversity_model.dart';
import 'package:medplant/widgets/biodiversity_card.dart';
import 'package:medplant/widgets/info_note.dart';
import 'package:medplant/widgets/section_header.dart';
import '/models/prediction_model.dart';
import '/widgets/prediction_card.dart';

class PredictionsScreen extends StatelessWidget {
  const PredictionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<dynamic>predictions = [
  PredictionModel(
    name: "Agapanthus Africanus",
    location: "Eastern Cape",
    similarity: 0.87,
    temperature: "18–22°C (Optimal)",
    season: "Early Summer",
    imageMatch: "High match",
    predictionNote: "Flowering in 2–3 weeks",
    icon: Icons.spa,
  ),
  PredictionModel(
    name: "Knowltonia Capensis",
    location: "Western Cape",
    similarity: 0.92,
    temperature: "15–19°C (Optimal)",
    season: "Spring",
    imageMatch: "Very high match",
    predictionNote: "Growth peak now",
    icon: Icons.park,
  ),
PredictionModel(
  name: "Lessertia Frutescens",
  location: "KwaZulu-Natal",
  similarity: 0.78,
  icon: Icons.spa,
  temperature: "20–25°C (Warm optimal range)",
  season: "Late Summer",
  imageMatch: "Moderate match",
  predictionNote: "Optimal in 3–4 weeks",
),BiodiversityModel(
    title: "Biodiversity Health Index",
    region: "All Regions",
    healthIndex: 0.84,
    status: "Regional Analysis",
    threatLevel: "Low–Moderate",
    conservationPriority: "Medium",
    reportsThisMonth: 12,
    mainIcon: Icons.biotech,
    healthIcon: Icons.trending_up,
    threatIcon: Icons.warning,
    priorityIcon: Icons.check_circle,
    reportsIcon: Icons.people,
  ),
];

    return Scaffold(
    body: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: SectionHeader(title: "IK Predictions"),
    ),

    // 🔥 ONE SCROLL VIEW FOR EVERYTHING
    Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // 🔥 GRID (now inside scroll)
            GridView.builder(
              shrinkWrap: true, // IMPORTANT
              physics: const NeverScrollableScrollPhysics(), // disable inner scroll
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemCount: predictions.length,
              itemBuilder: (context, index) {
                final item = predictions[index];

                if (item is PredictionModel) {
                  return PredictionCard(prediction: item);
                } else if (item is BiodiversityModel) {
                  return BiodiversityCard(biodiversity: item);
                }

                return const SizedBox();
              },
            ),

            // 🔥 INFO NOTE (now part of scroll)
            const InfoNote(),
          ],
        ),
      ),
    ),
  ],
),
    );
  }
}