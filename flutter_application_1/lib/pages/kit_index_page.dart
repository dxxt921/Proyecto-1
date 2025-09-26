import 'package:flutter/material.dart';
import '../../widgets/app_scaffold.dart'; 

class KitIndexPage extends StatelessWidget {
  const KitIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Proyecto (Kit Offline)',
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          ListTile(
            leading: const Icon(Icons.note_alt_outlined),
            title: const Text('Notas rápidas'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.pushNamed(context, '/project/notes'),
          ),
          ListTile(
            leading: const Icon(Icons.monitor_weight_outlined),
            title: const Text('Calculadora de IMC'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.pushNamed(context, '/project/bmi'),
          ),
          ListTile(
            leading: const Icon(Icons.photo_library_outlined),
            title: const Text('Galería local'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.pushNamed(context, '/project/gallery'),
          ),
          ListTile(
            leading: const Icon(Icons.calculate_outlined),
            title: const Text('Par o Impar'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.pushNamed(context, '/project/evenodd'),
          ),
        ],
      ),
    );
  }
}