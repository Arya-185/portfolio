// lib/features/public/components/footer.dart
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      // We explicitly set a very dark color (Slate 950) so it remains
      // dark in both Light and Dark modes.
      color: const Color(0xFF020617),
      alignment: Alignment.center,
      child: const Text(
        "© 2026 Arya Mehta. Built with Flutter & Riverpod.",
        style: TextStyle(
          color: Colors.white54, // Always light text
        ),
      ),
    );
  }
}
