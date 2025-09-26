// lib/pages/rps_page.dart
import 'dart:math';
import 'package:flutter/material.dart';
import '../widgets/app_scaffold.dart';

enum Rps { piedra, papel, tijera }
String _label(Rps r) =>
    switch (r) { Rps.piedra => 'Piedra', Rps.papel => 'Papel', Rps.tijera => 'Tijera' };

class RpsPage extends StatefulWidget {
  const RpsPage({super.key});
  @override
  State<RpsPage> createState() => _RpsPageState();
}

class _RpsPageState extends State<RpsPage> {
  final _rng = Random();
  int user = 0, cpu = 0;

  void _play(Rps pick) {
    final cpuPick = Rps.values[_rng.nextInt(3)];
    final win = (pick == Rps.piedra && cpuPick == Rps.tijera) ||
        (pick == Rps.papel && cpuPick == Rps.piedra) ||
        (pick == Rps.tijera && cpuPick == Rps.papel);
    final tie = pick == cpuPick;

    setState(() {
      if (!tie) {
        if (win) {
          user++;
        } else {
          cpu++;
        }
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Tú: ${_label(pick)} • CPU: ${_label(cpuPick)} → '
          '${tie ? 'Empate' : win ? '¡Ganaste!' : 'Perdiste'}',
        ),
      ),
    );
  }

  void _reset() => setState(() {
        user = 0;
        cpu = 0;
      });

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Juego RPS',
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Wrap(
                  spacing: 10,
                  children: [
                    FilledButton.icon(
                      onPressed: () => _play(Rps.piedra),
                      icon: const Icon(Icons.sports_martial_arts),
                      label: const Text('Piedra'),
                    ),
                    FilledButton.icon(
                      onPressed: () => _play(Rps.papel),
                      icon: const Icon(Icons.description),
                      label: const Text('Papel'),
                    ),
                    FilledButton.icon(
                      onPressed: () => _play(Rps.tijera),
                      icon: const Icon(Icons.content_cut),
                      label: const Text('Tijera'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Chip(label: Text('Tú: $user')),
                    const SizedBox(width: 8),
                    Chip(label: Text('CPU: $cpu')),
                    const SizedBox(width: 8),
                    OutlinedButton.icon(
                      onPressed: _reset,
                      icon: const Icon(Icons.restart_alt),
                      label: const Text('Reiniciar'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
