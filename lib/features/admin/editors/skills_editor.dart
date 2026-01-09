import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models.dart';
import '../../../providers/portfolio_state.dart';

class SkillsEditor extends ConsumerWidget {
  const SkillsEditor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skills = ref.watch(portfolioProvider).skills;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Skills",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ElevatedButton.icon(
              onPressed: () => _showAddDialog(context, ref),
              icon: const Icon(Icons.add),
              label: const Text("Add Skill"),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(skills.length, (index) {
              final skill = skills[index];
              return InputChip(
                label: Text(skill.name),
                onDeleted: () =>
                    ref.read(portfolioProvider.notifier).removeSkill(index),
                deleteIcon: const Icon(Icons.close, size: 18),
              );
            }),
          ),
        ),
      ],
    );
  }

  void _showAddDialog(BuildContext context, WidgetRef ref) {
    final nameCtrl = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Add Skill"),
        content: TextField(
          controller: nameCtrl,
          decoration: const InputDecoration(
            labelText: "Skill Name (e.g. Flutter)",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameCtrl.text.isNotEmpty) {
                // Defaulting category to 'General' for simplicity
                ref
                    .read(portfolioProvider.notifier)
                    .addSkill(Skill(nameCtrl.text, "General"));
                Navigator.pop(ctx);
              }
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }
}
