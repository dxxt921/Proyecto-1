Portafolio — Hub + Prácticas + Proyecto (Kit Offline)

Descripción general

App Flutter tipo portafolio que centraliza:

Un Hub (pantalla principal).

Un Índice de prácticas con navegación a P1–P5:

P1 Registro (validación + formulario + SnackBar).

P2 Lista (registros almacenados en memoria).

P3 Hola Mundo.

P4 Hola con botón (agrega/imprime hasta 10, con reset).

P5 Juego RPS (Piedra–Papel–Tijera, marcador en memoria).

Proyecto “Kit Offline” con 4 módulos (todo sin APIs ni persistencia):

Notas rápidas (notes_page.dart) — ListView + FAB + SnackBar, borrar todo.

Calculadora IMC (bmi_page.dart) — Form con validaciones + SnackBar.

Galería (gallery_page.dart) — GridView de assets + AlertDialog ampliado.

Par o Impar (even_odd_page.dart) — elección, número aleatorio 0–5 y marcador.

Ajustes con ThemeMode claro/oscuro (settings_page.dart).

Tecnologías

Flutter 3.x.

Sin paquetes externos (salvo cupertino_icons del template).

Estado en memoria con stores simples (ver lib/data/…_store.dart)


lib/
  data/
    hola_store.dart
    notes_store.dart
    registration_store.dart
  models/
    registration.dart
  pages/
    hub_page.dart
    practices_index_page.dart
    kit_index_page.dart
    settings_page.dart
    rps_page.dart
    registration_page.dart / registrations_page.dart
    hola_mundo.dart / hola_mundo_boton.dart
    kit/
      notes_page.dart
      bmi_page.dart
      gallery_page.dart
      even_odd_page.dart
  widgets/
    app_scaffold.dart
    app_settings.dart      // (control de ThemeMode)
  theme.dart
  main.dart

Navegación

Drawer global accesible desde todas las pantallas (Hub, Prácticas, Proyecto, Ajustes).

Rutas nombradas (cuando aplica) y Navigator.push para navegación secundaria.

Índices:

practices_index_page.dart → lista de P1–P5.

kit_index_page.dart → lista de módulos del Kit Offline.

Los módulos/pantallas reutilizan el mismo AppScaffold y tema para consistencia.

Cómo ejecutar
flutter pub get
flutter run -d chrome

Estado y almacenamiento

Sin persistencia: todo se almacena en memoria a través de stores (lib/data/…_store.dart).

Los stores exponen listas y operaciones (agregar, limpiar, etc.) que consumen las páginas.

Se usa setState/AnimatedBuilder para re-render inmediato.

UI/UX

Consistencia: AppScaffold, AppBar con títulos claros, ListTile/Card, espaciado homogéneo, iconografía Material.

Tema claro/oscuro con ThemeMode desde settings_page.dart (controlado por app_settings.dart).

Feedback inmediato: SnackBars para acciones (agregar/borrar/validar), Dialogs en Galería.

Limitaciones conocidas

Sin persistencia: al reiniciar la app, los datos vuelven a su estado inicial (diseño requerido).

Stores en memoria: solo pensados para esta práctica. Para producción se recomienda ChangeNotifier + Provider o Riverpod, y persistencia local.
