import 'package:flutter/material.dart';
import '../widgets/app_scaffold.dart';
import '../data/registration_store.dart';

class RegistrationsPage extends StatelessWidget {
  const RegistrationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = RegistrationStore.instance;
    return AppScaffold(
      title: 'Registros',
      actions: [
        IconButton(
          tooltip: 'Limpiar todo',
          onPressed: store.isEmpty ? null : () {
            final n = store.length;
            store.clear();
            final m = ScaffoldMessenger.of(context);
            m.clearSnackBars();
            m.showSnackBar(SnackBar(content: Text('Se limpiaron $n registro(s)')));
          },
          icon: const Icon(Icons.delete_sweep_outlined),
        )
      ],
      body: AnimatedBuilder(
        animation: store,
        builder: (context, _) {
          if (store.isEmpty) {
            return const Center(child: Text('No hay registros todavía'));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(18),
            itemCount: store.items.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (_, i) {
              final r = store.items[i];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(child: Text(r.name.isNotEmpty ? r.name[0].toUpperCase() : '?')),
                  title: Text(r.name),
                  subtitle: Text('${r.email}\n${r.createdAtLabel}'),
                  isThreeLine: true,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
