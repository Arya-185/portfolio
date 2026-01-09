// lib/features/admin/editors/projects_editor.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models.dart';
import '../../../providers/portfolio_state.dart';

class ProjectsEditor extends ConsumerWidget {
  const ProjectsEditor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(portfolioProvider).projects;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Projects",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ElevatedButton.icon(
              onPressed: () => _showProjectDialog(context, ref),
              icon: const Icon(Icons.add),
              label: const Text("Add Project"),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.separated(
            itemCount: projects.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final p = projects[index];
              return Card(
                child: ListTile(
                  title: Text(
                    p.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(p.desc),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => ref
                        .read(portfolioProvider.notifier)
                        .removeProject(index),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _showProjectDialog(BuildContext context, WidgetRef ref) {
    final titleCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    final tagsCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Add Project"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleCtrl,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: descCtrl,
              decoration: const InputDecoration(labelText: "Description"),
            ),
            TextField(
              controller: tagsCtrl,
              decoration: const InputDecoration(
                labelText: "Tags (comma separated)",
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              final tags = tagsCtrl.text
                  .split(',')
                  .map((e) => e.trim())
                  .toList();
              ref
                  .read(portfolioProvider.notifier)
                  .addProject(Project(titleCtrl.text, descCtrl.text, tags));
              Navigator.pop(ctx);
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }
}
