// lib/features/public/components/theme_toggle.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/theme_provider.dart';

class ThemeToggleButton extends ConsumerWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    // Simple check: if not explicitly light, treat as dark for icon state
    // (In a real app, you might check platform brightness if system)
    final isDark = themeMode == ThemeMode.dark;

    return IconButton(
      onPressed: () => ref.read(themeProvider.notifier).toggleTheme(),
      tooltip: "Toggle Theme",
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (child, anim) => RotationTransition(
          turns: child.key == const ValueKey('dark')
              ? Tween<double>(begin: 0.75, end: 1).animate(anim)
              : Tween<double>(begin: 1, end: 0.75).animate(anim),
          child: ScaleTransition(scale: anim, child: child),
        ),
        child: isDark
            ? const Icon(
                Icons.light_mode,
                key: ValueKey('light'),
                color: Colors.yellow,
              )
            : const Icon(
                Icons.dark_mode,
                key: ValueKey('dark'),
                color: Colors.grey,
              ),
      ),
    );
  }
}
