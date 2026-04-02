import 'package:flutter/material.dart';

class PredictionModel {
  final String name;
  final String location;
  final double similarity; // 🔥 use number, not string
  final String temperature;
  final String season;
  final String imageMatch;
  final String predictionNote;
  final IconData icon;

  PredictionModel({
    required this.name,
    required this.location,
    required this.similarity,
    required this.temperature,
    required this.season,
    required this.imageMatch,
    required this.predictionNote,
    required this.icon,
  });
}