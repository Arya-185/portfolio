// lib/features/public/sections/skills_section.dart
import 'package:flutter/material.dart';

import '../../../data/models.dart';
import '../components/section_wrapper.dart';

class SkillsSection extends StatelessWidget {
  final List<Skill> skills;

  const SkillsSection({required this.skills, super.key});

  @override
  Widget build(BuildContext context) {
    // Style comes automatically from Theme.of(context).chipTheme
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: "Skills"),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: skills.map((s) => Chip(label: Text(s.name))).toList(),
        ),
      ],
    );
  }
}
