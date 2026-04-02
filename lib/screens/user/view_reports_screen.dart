import 'package:flutter/material.dart';
import 'package:medplant/constants/app_colors.dart';
import 'package:medplant/models/report_model.dart';
import 'package:medplant/widgets/empty_state_report.dart';
import 'package:medplant/widgets/section_header.dart';
import 'package:medplant/widgets/report_card.dart';

class ViewReportsScreen extends StatelessWidget {
  const ViewReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ReportModel> reports = [
    ReportModel(
    imageUrl: "https://images.unsplash.com/photo-1501004318641-b39e6451bec6",
    location: "Nairobi Forest",
    date: "2024-01-15",
    environment: "22°C, Humid",
    description:
        "Observed a healthy population of Agapanthus Africanus flowering near the river bank.",
  ),
  ReportModel(
    imageUrl: "https://images.unsplash.com/photo-1502082553048-f009c37129b9",
    location: "Mount Kenya Region",
    date: "2024-01-20",
    environment: "18°C, Light rain",
    description:
        "Knowltonia Capensis specimens found in shaded areas under indigenous trees. Several young plants observed.",
  ),
  ReportModel(
    imageUrl: "https://images.unsplash.com/photo-1473773508845-188df298d2d1",
    location: "Coastal Region",
    date: "2024-01-25",
    environment: "28°C, Sunny",
    description:
        "Lessertia frutescens thriving in well-drained soil. Traditional healer reported increased harvesting pressure.",
  ),
  ReportModel(
    imageUrl: "https://images.unsplash.com/photo-1441974231531-c6227db76b6e",
    location: "Kakamega Forest",
    date: "2024-02-01",
    environment: "24°C, Partly cloudy",
    description:
        "Multiple medicinal plant species observed. Community members actively participating in conservation efforts.",
  ),
  ReportModel(
    imageUrl: "https://images.unsplash.com/photo-1497250681960-ef046c08a56e",
    location: "Drakensberg Mountains",
    date: "2024-02-10",
    environment: "12°C, Windy",
    description:
        "High altitude vegetation showing signs of stress due to strong winds and low temperatures. Some species adapting well.",
  ),
  ReportModel(
    imageUrl: "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee",
    location: "Kruger National Park",
    date: "2024-02-14",
    environment: "30°C, Dry",
    description:
        "Observed drought stress in several plant populations. Soil extremely dry with visible cracks affecting growth.",
  ),
  ReportModel(
    imageUrl: "https://images.unsplash.com/photo-1508780709619-79562169bc64",
    location: "Cape Floral Region",
    date: "2024-02-18",
    environment: "20°C, Mild",
    description:
        "Fynbos vegetation thriving after recent rains. Excellent biodiversity with several flowering species observed.",
  ),
  ReportModel(
    imageUrl: "https://images.unsplash.com/photo-1501785888041-af3ef285b470",
    location: "Limpopo River Basin",
    date: "2024-02-22",
    environment: "26°C, Wet soil",
    description:
        "Riverbank vegetation recovering well after flooding. Some erosion observed but plant regeneration is strong.",
  ),
];

    return Scaffold(
      backgroundColor: const Color(0xFFF7FAF8),
      // appBar: AppBar(
      //   title: const Text("Observation Reports",style: TextStyle(color:AppColors.white)),
      //   backgroundColor: AppColors.primaryDark,
      // ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: const EdgeInsets.all(16),
          child: reports.isEmpty
              ? const EmptyState()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionHeader(title: "Observation Reports"),
                    const SizedBox(height: 20),

                    Expanded(
                      child: GridView.builder(
  padding: const EdgeInsets.all(16),
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2, // 1 for mobile, 2–3 for tablet/web
    crossAxisSpacing: 16,
    mainAxisSpacing: 16,
    childAspectRatio: 0.75,
  ),
  itemCount: reports.length,
  itemBuilder: (context, index) {
    final report = reports[index];

    return ReportCard(
      imageUrl: report.imageUrl,
      location: report.location,
      date: report.date,
      environment: report.environment,
      description: report.description,
    );
  },
)
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}