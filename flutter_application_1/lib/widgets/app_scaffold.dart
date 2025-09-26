import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget>? actions;
  const AppScaffold({super.key, required this.title, required this.body, this.actions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), actions: actions),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 8),
            children: [
              const ListTile(title: Text('Menú', style: TextStyle(fontWeight: FontWeight.w700))),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Inicio (Hub)'),
                onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false),
              ),
              ListTile(
                leading: const Icon(Icons.view_list),
                title: const Text('Índice de prácticas'),
                onTap: () => Navigator.pushNamed(context, '/practices'),
              ),
              ExpansionTile(
                leading: const Icon(Icons.build),
                title: const Text('Proyecto: Kit Offline'),
                children: [
                  ListTile(
                    leading: const Icon(Icons.note_alt_outlined),
                    title: const Text('Notas rápidas'),
                    onTap: () => Navigator.pushNamed(context, '/project/notes'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.monitor_weight),
                    title: const Text('Calculadora IMC'),
                    onTap: () => Navigator.pushNamed(context, '/project/bmi'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.photo_library_outlined),
                    title: const Text('Galería local'),
                    onTap: () => Navigator.pushNamed(context, '/project/gallery'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.casino),
                    title: const Text('Par o Impar'),
                    onTap: () => Navigator.pushNamed(context, '/project/evenodd'),
                  ),
                ],
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Ajustes'),
                onTap: () => Navigator.pushNamed(context, '/settings'),
              ),
            ],
          ),
        ),
      ),
      body: body,
    );
  }
}
