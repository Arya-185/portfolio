// lib/features/admin/editors/visibility_editor.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/portfolio_state.dart';

class VisibilityEditor extends ConsumerWidget {
  const VisibilityEditor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visibility = ref.watch(portfolioProvider).sectionVisibility;

    return ListView(
      children: [
        const Text(
          "Section Visibility",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        ...visibility.keys.map(
          (key) => SwitchListTile(
            title: Text(key.toUpperCase()),
            value: visibility[key] ?? true,
            onChanged: (val) {
              ref.read(portfolioProvider.notifier).toggleSection(key);
            },
          ),
        ),
      ],
    );
  }
}
