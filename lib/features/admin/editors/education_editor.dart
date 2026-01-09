import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models.dart';
import '../../../providers/portfolio_state.dart';

class EducationEditor extends ConsumerWidget {
  const EducationEditor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final education = ref.watch(portfolioProvider).education;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Education",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ElevatedButton.icon(
              onPressed: () => _showAddDialog(context, ref),
              icon: const Icon(Icons.add),
              label: const Text("Add Education"),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.separated(
            itemCount: education.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final edu = education[index];
              return Card(
                child: ListTile(
                  title: Text(
                    edu.school,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("${edu.degree} • ${edu.period}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => ref
                        .read(portfolioProvider.notifier)
                        .removeEducation(index),
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
    final schoolCtrl = TextEditingController();
    final degreeCtrl = TextEditingController();
    final periodCtrl = TextEditingController();
    final descCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Add Education"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: schoolCtrl,
                decoration: const InputDecoration(
                  labelText: "School/University",
                ),
              ),
              TextField(
                controller: degreeCtrl,
                decoration: const InputDecoration(labelText: "Degree"),
              ),
              TextField(
                controller: periodCtrl,
                decoration: const InputDecoration(labelText: "Period"),
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
                  .addEducation(
                    Education(
                      degreeCtrl.text,
                      schoolCtrl.text,
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
