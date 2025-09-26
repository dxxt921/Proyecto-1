import 'package:flutter/material.dart';
import '../../widgets/app_scaffold.dart';
import '../../data/notes_store.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});
  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final _ctrl = TextEditingController();
  @override void dispose() { _ctrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final store = NotesStore.instance;

    void add() {
      final t = _ctrl.text.trim();
      if (t.isEmpty) return;
      store.add(t);
      _ctrl.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nota agregada')),
      );
    }

    void clear() {
      final n = store.length;
      store.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Se borraron $n notas')),
      );
    }

    return AppScaffold(
      title: 'Notas rápidas',
      actions: [
        AnimatedBuilder(
          animation: store,
          builder: (_, __) => IconButton(
            onPressed: store.isEmpty ? null : clear,
            icon: const Icon(Icons.delete_sweep_outlined),
            tooltip: 'Borrar todo',
          ),
        )
      ],
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(children: [
                  Expanded(
                    child: TextField(
                      controller: _ctrl,
                      decoration: const InputDecoration(
                        hintText: 'Escribe una nota...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  FilledButton.icon(
                    onPressed: add,
                    icon: const Icon(Icons.add),
                    label: const Text('Agregar'),
                  )
                ]),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: AnimatedBuilder(
                animation: store,
                builder: (_, __) {
                  if (store.isEmpty) {
                    return const Center(child: Text('No hay notas'));
                  }
                  return ListView.separated(
                    itemCount: store.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (_, i) =>
                        Card(child: ListTile(title: Text(store.notes[i]))),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
