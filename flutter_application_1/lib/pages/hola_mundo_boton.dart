import 'package:flutter/material.dart';
import '../widgets/app_scaffold.dart';
import '../data/hola_store.dart';

class HolaMundoConBoton extends StatelessWidget {
  const HolaMundoConBoton({super.key});

  @override
  Widget build(BuildContext context) {
    final store = HolaStore.instance;

    void warnIfFull() {
      if (store.length >= HolaStore.max) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Máximo 10 "Hola Mundo".')),
        );
      }
    }

    return AppScaffold(
      title: 'Hola con botón',
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Wrap(spacing: 10, children: [
              FilledButton(
                onPressed: () { store.addOne(); warnIfFull(); },
                child: const Text('Agregar'),
              ),
              FilledButton(
                onPressed: () { store.addTen(); warnIfFull(); },
                child: const Text('Imprimir 10'),
              ),
              OutlinedButton(
                onPressed: store.clear,
                child: const Text('Limpiar'),
              ),
            ]),
            const SizedBox(height: 12),
            Expanded(
              child: AnimatedBuilder(
                animation: store,
                builder: (_, __) {
                  if (store.length == 0) {
                    return const Center(child: Text('Sin elementos'));
                  }
                  return ListView.builder(
                    itemCount: store.length,
                    itemBuilder: (_, i) => ListTile(title: Text(store.items[i])),
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
