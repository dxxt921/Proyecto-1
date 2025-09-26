import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_settings.dart';
import 'theme.dart';
import 'widgets/app_background.dart'; // Importa el widget de fondo

// Hub / índice / ajustes
import 'pages/hub_page.dart';
import 'pages/practices_index_page.dart';
import 'pages/settings_page.dart';
import 'pages/kit_index_page.dart';

// Prácticas
import 'pages/registration_page.dart';
import 'pages/registrations_page.dart';
import 'pages/hola_mundo.dart';
import 'pages/hola_mundo_boton.dart';
import 'pages/rps_page.dart';

// Kit Offline
import 'pages/kit/notes_page.dart';
import 'pages/kit/bmi_page.dart';
import 'pages/kit/gallery_page.dart';
import 'pages/kit/even_odd_page.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppSettings(),
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppSettings>(
      builder: (context, settings, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Portafolio — Hub',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: settings.mode,
          initialRoute: '/',
          routes: {
            '/': (_) => const HubPage(),
            '/practices': (_) => const PracticesIndexPage(),
            '/settings': (_) => const SettingsPage(),
            '/kit': (_) => const KitIndexPage(),
            '/p/registro': (_) => const RegistrationPage(),
            '/p/lista': (_) => const RegistrationsPage(),
            '/p/hola': (_) => const HolaMundo(),
            '/p/boton': (_) => const HolaMundoConBoton(),
            '/p/rps': (_) => const RpsPage(),
            '/project/notes': (_) => const NotesPage(),
            '/project/bmi': (_) => const BmiPage(),
            '/project/gallery': (_) => const GalleryPage(),
            '/project/evenodd': (_) => const EvenOddPage(),
          },
          // Usamos el builder para poner el fondo detrás de todo
          builder: (context, child) {
            return Stack(
              children: [
                const AppBackground(), // El fondo dinámico que creamos
                child ?? const SizedBox(), // El contenido de tu app
              ],
            );
          },
        );
      },
    );
  }
}