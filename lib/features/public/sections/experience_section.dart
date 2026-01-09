// lib/features/public/sections/experience_section.dart
import 'package:flutter/material.dart';

import '../../../data/models.dart';
import '../components/section_wrapper.dart';

class ExperienceSection extends StatelessWidget {
  final List<Experience> experience;

  const ExperienceSection({required this.experience, super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: "Experience"),
        const SizedBox(height: 32),
        ...experience.map(
          (e) => ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              e.role,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  "${e.company} • ${e.period}",
                  style: TextStyle(color: colorScheme.primary),
                ),
                const SizedBox(height: 8),
                Text(e.desc, style: const TextStyle(height: 1.5)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
