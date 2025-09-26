import 'package:flutter/material.dart';
import '../widgets/app_scaffold.dart';
import '../data/hola_store.dart';

class HolaMundo extends StatelessWidget {
  const HolaMundo({super.key});

  @override
  Widget build(BuildContext context) {
    final store = HolaStore.instance;
    return AppScaffold(
      title: 'Hola Mundo',
      body: Center(
        child: AnimatedBuilder(
          animation: store,
          builder: (_, __) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Hola Mundo'),
              const SizedBox(height: 8),
              Chip(label: Text('Impresos: ${store.length}/${HolaStore.max}')),
            ],
          ),
        ),
      ),
    );
  }
}
