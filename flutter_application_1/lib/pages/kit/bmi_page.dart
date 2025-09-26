import 'package:flutter/material.dart';
import '../../widgets/app_scaffold.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({super.key});
  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  final _form = GlobalKey<FormState>();
  final _h = TextEditingController();
  final _w = TextEditingController();
  AutovalidateMode _auto = AutovalidateMode.disabled;

  @override
  void dispose() {
    _h.dispose();
    _w.dispose();
    super.dispose();
  }

  String? _pos(String? v) {
    final t = (v ?? '').trim();
    if (t.isEmpty) {
      return 'Requerido';
    }
    final n = double.tryParse(t);
    if (n == null || n <= 0) {
      return 'Debe ser > 0';
    }
    return null;
  }

  void _calc() {
    setState(() {
      _auto = AutovalidateMode.onUserInteraction;
    });
    if (!_form.currentState!.validate()) {
      return;
    }

    final h = double.parse(_h.text.trim());
    final w = double.parse(_w.text.trim());
    final bmi = w / (h * h);

    String cat;
    if (bmi < 18.5) {
      cat = 'Bajo peso';
    } else if (bmi < 25) {
      cat = 'Normal';
    } else if (bmi < 30) {
      cat = 'Sobrepeso';
    } else {
      cat = 'Obesidad';
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('IMC: ${bmi.toStringAsFixed(1)} • $cat')),
    );
  }

  void _reset() {
    _form.currentState?.reset();
    _h.clear();
    _w.clear();
    setState(() {
      _auto = AutovalidateMode.disabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Calculadora IMC',
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _form,
                  autovalidateMode: _auto,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _h,
                        decoration: const InputDecoration(
                          labelText: 'Estatura (m)',
                          prefixIcon: Icon(Icons.height),
                        ),
                        keyboardType: TextInputType.number,
                        validator: _pos,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _w,
                        decoration: const InputDecoration(
                          labelText: 'Peso (kg)',
                          prefixIcon: Icon(Icons.monitor_weight),
                        ),
                        keyboardType: TextInputType.number,
                        validator: _pos,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: FilledButton.icon(
                              onPressed: _calc,
                              icon: const Icon(Icons.calculate),
                              label: const Text('Calcular'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: _reset,
                              icon: const Icon(Icons.refresh),
                              label: const Text('Limpiar'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
