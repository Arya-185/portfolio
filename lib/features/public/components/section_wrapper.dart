// lib/features/public/components/section_wrapper.dart
import 'package:flutter/material.dart';

class SectionWrapper extends StatelessWidget {
  final Widget child;

  const SectionWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
          child: child,
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    // Using display/headline styles from theme ensures font consistency
    return Text(
      title,
      style: Theme.of(
        context,
      ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w800),
    );
  }
}
