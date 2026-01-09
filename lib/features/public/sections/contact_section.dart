// lib/features/public/sections/contact_section.dart
import 'package:flutter/material.dart';

class ContactSection extends StatelessWidget {
  final String email;

  const ContactSection({required this.email, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Let's Build Something Together",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        SelectableText(
          email,
          style: TextStyle(
            fontSize: 20,
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
