import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models.dart';
import '../../../providers/portfolio_state.dart';

class ExperienceEditor extends ConsumerWidget {
  const ExperienceEditor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final experience = ref.watch(portfolioProvider).experience;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Experience",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ElevatedButton.icon(
              onPressed: () => _showAddDialog(context, ref),
              icon: const Icon(Icons.add),
              label: const Text("Add Job"),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.separated(
            itemCount: experience.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final exp = experience[index];
              return Card(
                child: ListTile(
                  title: Text(
                    exp.role,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("${exp.company} • ${exp.period}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => ref
                        .read(portfolioProvider.notifier)
                        .removeExperience(index),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _showAddDialog(BuildContext context, WidgetRef ref) {
    final roleCtrl = TextEditingController();
    final companyCtrl = TextEditingController();
    final periodCtrl = TextEditingController();
    final descCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Add Experience"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: roleCtrl,
                decoration: const InputDecoration(labelText: "Role"),
              ),
              TextField(
                controller: companyCtrl,
                decoration: const InputDecoration(labelText: "Company"),
              ),
              TextField(
                controller: periodCtrl,
                decoration: const InputDecoration(
                  labelText: "Period (e.g. 2023-Present)",
                ),
              ),
              TextField(
                controller: descCtrl,
                decoration: const InputDecoration(labelText: "Description"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(portfolioProvider.notifier)
                  .addExperience(
                    Experience(
                      roleCtrl.text,
                      companyCtrl.text,
                      periodCtrl.text,
                      descCtrl.text,
                    ),
                  );
              Navigator.pop(ctx);
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }
}
