// lib/features/public/sections/education_section.dart
import 'package:flutter/material.dart';

import '../../../data/models.dart';
import '../components/section_wrapper.dart';

class EducationSection extends StatelessWidget {
  final List<Education> education;

  const EducationSection({required this.education, super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: "Education"),
        const SizedBox(height: 32),
        ...education.map(
          (e) => Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 2,
                      height: 80,
                      color: colorScheme
                          .outline, // Uses theme divider/outline color
                    ),
                  ],
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e.school,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        e.degree,
                        style: TextStyle(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        e.period,
                        style: TextStyle(
                          color: colorScheme.secondary,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(e.desc, style: const TextStyle(height: 1.5)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
