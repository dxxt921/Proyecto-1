import 'dart:ui';
import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
      ),
      child: Stack(
        children: [
          // Círculo de color superior
          Positioned(
            top: -100,
            left: -150,
            child: CircleBlur(color: colors.primary.withOpacity(0.4)),
          ),
          // Círculo de color inferior
          Positioned(
            bottom: -150,
            right: -100,
            child: CircleBlur(color: colors.secondary.withOpacity(0.4)),
          ),
        ],
      ),
    );
  }
}

class CircleBlur extends StatelessWidget {
  final Color color;
  const CircleBlur({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 400,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
        child: Container(
          decoration: const BoxDecoration(shape: BoxShape.circle),
        ),
      ),
    );
  }
}