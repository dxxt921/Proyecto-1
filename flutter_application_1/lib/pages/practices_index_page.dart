import 'package:flutter/material.dart';
import '../widgets/app_scaffold.dart';

class PracticesIndexPage extends StatelessWidget {
  const PracticesIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <_P>[
      _P('P1 – Registro', '/p/registro', Icons.app_registration),
      _P('P2 – Lista', '/p/lista', Icons.receipt_long),
      _P('P3 – Hola Mundo', '/p/hola', Icons.text_fields),
      _P('P4 – Hola con botón', '/p/boton', Icons.smart_button),
      _P('P5 – Juego RPS', '/p/rps', Icons.content_cut),
    ];

    return AppScaffold(
      title: 'Índice de prácticas',
      body: ListView.separated(
        padding: const EdgeInsets.all(18),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (_, i) {
          final p = items[i];
          return Card(
            child: ListTile(
              leading: CircleAvatar(child: Icon(p.icon)),
              title: Text(p.title),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.pushNamed(context, p.route),
            ),
          );
        },
      ),
    );
  }
}

class _P { final String title, route; final IconData icon; _P(this.title, this.route, this.icon); }
