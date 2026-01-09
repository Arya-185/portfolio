// lib/features/admin/editors/theme_editor.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/portfolio_state.dart';

class ThemeEditor extends ConsumerWidget {
  const ThemeEditor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentConfig = ref.watch(portfolioProvider).themeConfig;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Design & Theme",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        const Text("Primary Brand Color"),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          children: [
            _ColorOption(
              color: const Color(0xFF2563EB),
              selected: currentConfig.primaryColorValue == 0xFF2563EB,
            ),
            _ColorOption(
              color: Colors.purple,
              selected:
                  currentConfig.primaryColorValue == Colors.purple.toARGB32(),
            ),
            _ColorOption(
              color: Colors.teal,
              selected:
                  currentConfig.primaryColorValue == Colors.teal.toARGB32(),
            ),
            _ColorOption(
              color: Colors.orange,
              selected:
                  currentConfig.primaryColorValue == Colors.orange.toARGB32(),
            ),
            _ColorOption(
              color: Colors.red,
              selected:
                  currentConfig.primaryColorValue == Colors.red.toARGB32(),
            ),
          ],
        ),
      ],
    );
  }
}

class _ColorOption extends ConsumerWidget {
  final Color color;
  final bool selected;

  const _ColorOption({required this.color, required this.selected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(portfolioProvider.notifier).updateThemeColor(color.toARGB32());
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: selected ? Border.all(color: Colors.black, width: 3) : null,
        ),
        child: selected ? const Icon(Icons.check, color: Colors.white) : null,
      ),
    );
  }
}
