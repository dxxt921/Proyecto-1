import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/app_scaffold.dart';

class HubPage extends StatelessWidget {
  const HubPage({super.key});

  @override
  Widget build(BuildContext context) {
    final gridCols = MediaQuery.of(context).size.width > 900 ? 3 : 1;

    return AppScaffold(
      title: 'Portafolio',
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: GridView.count(
              crossAxisCount: gridCols,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              // ✨ LA CORRECCIÓN ESTÁ AQUÍ:
              // La animación se aplica a la lista de widgets, no al GridView.
              children: [
                _tile(context, 'Prácticas', Icons.view_list_outlined, '/practices'),
                _tile(context, 'Proyecto (Kit Offline)', Icons.memory_outlined, '/kit'),
                _tile(context, 'Ajustes', Icons.settings_outlined, '/settings'),
              ]
              .animate(interval: 200.ms) // Ahora 'interval' es válido
              .fadeIn(duration: 500.ms)
              .slideY(begin: 0.5, end: 0)
              .shimmer(duration: 1000.ms, color: Colors.white.withOpacity(0.1)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _tile(BuildContext context, String title, IconData icon, String route) {
    final colors = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      child: Ink(
        decoration: BoxDecoration(
          color: colors.surface.withOpacity(0.8),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: colors.primary.withOpacity(0.5)),
          boxShadow: [
            BoxShadow(
              color: colors.primary.withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 2,
            ),
            BoxShadow(
              color: colors.secondary.withOpacity(0.2),
              blurRadius: 20,
              spreadRadius: 5,
              offset: const Offset(5, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: colors.secondary),
              const SizedBox(height: 16),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: colors.onSurface,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}