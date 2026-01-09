// lib/features/public/sections/about_section.dart
import 'package:flutter/material.dart';

import '../components/section_wrapper.dart';

class AboutSection extends StatelessWidget {
  final String about;

  const AboutSection({required this.about, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: "About"),
        const SizedBox(height: 20),
        Text(about, style: const TextStyle(fontSize: 18, height: 1.8)),
      ],
    );
  }
}
