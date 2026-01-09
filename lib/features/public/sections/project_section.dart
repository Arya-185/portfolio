// lib/features/public/sections/project_section.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/models.dart';
import '../components/section_wrapper.dart';

class ProjectsSection extends StatelessWidget {
  final List<Project> projects;

  const ProjectsSection({required this.projects, super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: "Projects"),
        const SizedBox(height: 32),
        ...projects.map(
          (p) => Card(
            elevation: 0, // start flat
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: colorScheme.outline.withValues(alpha: 0.5),
              ),
            ),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: p.link != null
                  ? () => launchUrl(Uri.parse(p.link!))
                  : null,
              hoverColor: colorScheme.primary.withValues(alpha: 0.05),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            p.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        if (p.link != null)
                          Icon(
                            Icons.arrow_outward,
                            size: 20,
                            color: colorScheme.primary,
                          ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      p.desc,
                      style: TextStyle(
                        height: 1.6,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: p.tags
                          .map(
                            (t) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.secondaryContainer
                                    .withValues(alpha: 0.3),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: colorScheme.outline.withValues(
                                    alpha: 0.3,
                                  ),
                                ),
                              ),
                              child: Text(
                                t,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: colorScheme.primary,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
