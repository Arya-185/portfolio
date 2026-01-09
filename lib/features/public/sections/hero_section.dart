// lib/features/public/sections/hero_section.dart
import 'package:flutter/material.dart';

import '../../../data/models.dart';

class HeroSection extends StatelessWidget {
  final PortfolioData data;

  const HeroSection({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "👋 Hello, I'm",
            style: TextStyle(
              color: colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          data.name,
          style: theme.textTheme.displayLarge?.copyWith(
            fontSize: 56,
            fontWeight: FontWeight.w900,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          data.title,
          style: theme.textTheme.headlineSmall?.copyWith(
            color: colorScheme.secondary,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
