// lib/features/public/components/nav_bar.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'theme_toggle.dart'; // Import the toggle button

class NavBar extends StatelessWidget {
  final String name;

  const NavBar({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    // Use Theme.of(context).colorScheme to adapt to light/dark automatically
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          Row(
            children: [
              const ThemeToggleButton(), // <--- ADDED HERE
              const SizedBox(width: 8),
              IconButton(
                icon: Icon(
                  Icons.admin_panel_settings_outlined,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                tooltip: "Admin Login",
                onPressed: () => context.go('/admin'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
