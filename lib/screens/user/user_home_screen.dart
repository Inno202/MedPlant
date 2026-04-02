// screens/user_home_screen.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medplant/widgets/app_bar_widget.dart';
import 'package:medplant/widgets/auth_cta_section.dart';
import 'package:medplant/widgets/badge_row.dart';
import 'package:medplant/widgets/capability_grid.dart';
import 'package:medplant/widgets/hero_section.dart';
import 'package:medplant/widgets/info_grid.dart';
import 'package:medplant/widgets/plant_grid.dart';
import 'package:medplant/widgets/platform_ticker.dart';
import 'package:medplant/widgets/section_header.dart';
import 'package:medplant/models/plant_model.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive logic for grid columns
    int capabilityColumns = 1;
    int plantColumns = 1;

    if (screenWidth >= 600) {
      capabilityColumns = 2;
      plantColumns = 2;
    }
    if (screenWidth >= 900) {
      capabilityColumns = 3;
      plantColumns = 3;
    }

    final List<PlantModel> plants = [
      PlantModel(
        name: "Agapanthus Africanus",
        scientificName: "African Lily",
        imageUrl:
            "https://images.unsplash.com/photo-1501004318641-b39e6451bec6",
      ),
      PlantModel(
        name: "Knowltonia Capensis",
        scientificName: "Brandblare",
        imageUrl:
            "https://images.unsplash.com/photo-1501004318641-b39e6451bec6",
      ),
      PlantModel(
        name: "Lessertia Frutescens",
        scientificName: "Cancer Bush",
        imageUrl:
            "https://images.unsplash.com/photo-1501004318641-b39e6451bec6",
      ),
    ];

    return Scaffold(
    //  appBar: const AppBarWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const HeroSection(),
              const SizedBox(height: 15),

              const SectionHeader(title: "Platform Overview"),
              PlatformTicker(),
            

              // Core Capabilities Section
              const SectionHeader(title: "Core Capability Areas"),
              CapabilityGrid(),

              // Medicinal Plants Section
              const SectionHeader(title: "Medicinal Plants"),
              PlantGrid(plants: plants, ),

              const SizedBox(height: 16),
              const InfoGrid(),
              const SizedBox(height: 16),
              const AuthCTASection(),
              const SizedBox(height: 16),
              const BadgeRow(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}