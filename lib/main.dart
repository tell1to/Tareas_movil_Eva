import 'package:flutter/material.dart';
import 'package:menu/src/appmenu.dart';
import 'package:menu/src/screens/inicio_screen.dart';
import 'package:menu/src/screens/formularios_screen.dart';
import 'package:menu/src/screens/botones_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      // 1) Definición de tema global:
      theme: ThemeData(
        // Color de fondo de todas las pantallas
        scaffoldBackgroundColor: const Color.fromARGB(0, 255, 255, 255),
        // Color principal (AppBar, botones por defecto, etc.)
        primaryColor: const Color.fromARGB(255, 190, 233, 232),
        // Color secundario (controles resaltados, FAB, etc.)
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromARGB(255, 202, 233, 255),
          secondary: const Color.fromARGB(255, 95, 168, 211),
          background: const Color.fromARGB(255, 98, 182, 203),
        ),
        // Ajustes específicos del AppBar
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 27, 73, 101),
          iconTheme: IconThemeData(color: Color.fromARGB(221, 209, 209, 209)),
          titleTextStyle: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        // Texto por defecto en negro sobre fondo claro
        textTheme: ThemeData.light().textTheme.apply(
              bodyColor: const Color.fromARGB(221, 0, 0, 0),
              displayColor: Colors.black87,
              
            ),
      ),
      builder: (context, child) {
        return Stack(
          children: [
            // 1. Imagen de fondo (ocupa todo)
            Positioned.fill(
              child: Image.asset(
                'images/windows-11-abstracto-claro_3840x2160_xtrafondos.com.jpg',
                fit: BoxFit.cover,
              ),
            ),
            // 2. El resto de la app sobre la imagen
            if (child != null) child,
          ],
        );
      },
      initialRoute: '/',
      home: const MenuPrincipal(),
       routes: {
        //'/':             (ctx) => const MenuPrincipal(),
        '/inicio':      (ctx) => const InicioScreen(),
        '/formularios': (ctx) => const FormulariosScreen(),
        '/botones': (ctx) => const BotonesScreen(),
       }
    );
  }
}
