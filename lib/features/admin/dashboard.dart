// lib/features/admin/dashboard.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/auth_provider.dart'; // Import Auth
// ... imports for editors ...
import 'editors/education_editor.dart';
import 'editors/experience_editor.dart';
import 'editors/general_editor.dart';
import 'editors/projects_editor.dart';
import 'editors/skills_editor.dart';
import 'editors/theme_editor.dart';
import 'editors/visibility_editor.dart';

class AdminDashboardPage extends ConsumerStatefulWidget {
  const AdminDashboardPage({super.key});

  @override
  ConsumerState<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends ConsumerState<AdminDashboardPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    // Use theme background instead of hardcoded grey
    final bgColor = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      backgroundColor: bgColor,
      body: Row(
        children: [
          NavigationRail(
            backgroundColor: colorScheme.surface,
            // Fix Rail Background
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() => _selectedIndex = index);
            },
            labelType: NavigationRailLabelType.all,
            // Ensure Icons use Theme colors
            unselectedIconTheme: IconThemeData(
              color: colorScheme.onSurface.withValues(alpha: 0.6),
            ),
            selectedIconTheme: IconThemeData(color: colorScheme.primary),
            unselectedLabelTextStyle: TextStyle(
              color: colorScheme.onSurface.withValues(alpha: 0.6),
            ),
            selectedLabelTextStyle: TextStyle(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
            leading: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Icon(
                Icons.admin_panel_settings,
                size: 32,
                color: colorScheme.primary,
              ),
            ),
            trailing: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.logout, color: colorScheme.error),
                    tooltip: "Logout",
                    onPressed: () {
                      ref.read(authProvider.notifier).logout(); // Logout action
                      // GoRouter redirects automatically
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.person),
                label: Text('General'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.palette),
                label: Text('Theme'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.code),
                label: Text('Skills'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.work),
                label: Text('Projects'),
              ),
              // --- ADD THESE TWO ---
              NavigationRailDestination(
                icon: Icon(Icons.school),
                label: Text('Education'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.history),
                label: Text('Experience'),
              ),
              // --------------------
              NavigationRailDestination(
                icon: Icon(Icons.visibility),
                label: Text('Visibility'),
              ),
            ],
          ),
          VerticalDivider(thickness: 1, width: 1, color: colorScheme.outline),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: _buildContent(_selectedIndex),
            ),
          ),
        ],
      ),
    );
  }

  // ... _buildContent function remains the same
}

Widget _buildContent(int index) {
  switch (index) {
    case 0:
      return const GeneralEditor();
    case 1:
      return const ThemeEditor();
    case 2:
      return const SkillsEditor();
    case 3:
      return const ProjectsEditor();
    case 4:
      return const EducationEditor();
    case 5:
      return const ExperienceEditor();
    case 6:
      return const VisibilityEditor();
    default:
      return const Center(child: Text("Select a section"));
  }
}
