import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import '../widgets/app_scaffold.dart';
import '../app_settings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
  
    final settings = context.watch<AppSettings>();
    final isDark = settings.mode == ThemeMode.dark;

    return AppScaffold(
      title: 'Ajustes',
      
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          SwitchListTile(
            title: const Text('Tema oscuro'),
            value: isDark,
            
            onChanged: (value) {
              context.read<AppSettings>().setDark(value);
            },
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Acerca de'),
            subtitle: Text('Versión 1.0.0 • Autor: Leonardo Fiesco Ramirez de Arellano'),
          ),
        ],
      ),
    );
  }
}
