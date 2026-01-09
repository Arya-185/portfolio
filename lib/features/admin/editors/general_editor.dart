// lib/features/admin/editors/general_editor.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/portfolio_state.dart';

class GeneralEditor extends ConsumerStatefulWidget {
  const GeneralEditor({super.key});

  @override
  ConsumerState<GeneralEditor> createState() => _GeneralEditorState();
}

class _GeneralEditorState extends ConsumerState<GeneralEditor> {
  late TextEditingController _nameCtrl;
  late TextEditingController _titleCtrl;
  late TextEditingController _aboutCtrl;

  @override
  void initState() {
    super.initState();
    final data = ref.read(portfolioProvider);
    _nameCtrl = TextEditingController(text: data.name);
    _titleCtrl = TextEditingController(text: data.title);
    _aboutCtrl = TextEditingController(text: data.about);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          "General Information",
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        _buildField("Name", _nameCtrl),
        _buildField("Title", _titleCtrl),
        _buildField("About Me", _aboutCtrl, maxLines: 5),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: () {
            ref
                .read(portfolioProvider.notifier)
                .updateProfile(
                  name: _nameCtrl.text,
                  title: _titleCtrl.text,
                  about: _aboutCtrl.text,
                );
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Profile Updated!")));
          },
          icon: const Icon(Icons.save),
          label: const Text("Save Changes"),
        ),
      ],
    );
  }

  Widget _buildField(
    String label,
    TextEditingController ctrl, {
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: ctrl,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          filled: true,
          // CRITICAL FIX: Do NOT use Colors.white. Use null (defaults to theme)
          // or Theme.of(context).colorScheme.surface
          fillColor: Theme.of(context).colorScheme.surface,
        ),
      ),
    );
  }
}
