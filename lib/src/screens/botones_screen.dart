import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class BotonesScreen extends StatefulWidget {
  const BotonesScreen({super.key});

  @override
  State<BotonesScreen> createState() => _BotonesScreenState();
}

class _BotonesScreenState extends State<BotonesScreen> {
  int _currentIndex = 0;

  final GlobalKey<SlideActionState> key1 = GlobalKey();
  final GlobalKey<SlideActionState> key2 = GlobalKey();

  List<Widget> get _pages => [
        // Página con los botones swipe
        Padding(
  padding: const EdgeInsets.all(20.0),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SlideAction(
        text: "Desliza para confirmar",
        key: key1,
        onSubmit: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("¡Confirmado!")),
          );
          key1.currentState!.reset();
        },
        innerColor: Colors.redAccent,
        outerColor: Colors.grey[300]!,
      ),
      const SizedBox(height: 20),
      SlideAction(
        text: "Desliza para continuar",
        key: key2,
        onSubmit: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("¡Continuado!")),
          );
          key2.currentState!.reset();
        },
        innerColor: Colors.blue,
        outerColor: Colors.lightBlue.shade100,
      ),
      const SizedBox(height: 20),
      SlideAction(
        text: "Siguiente paso",
        onSubmit: () {},
        innerColor: Colors.yellow,
        outerColor: Colors.orangeAccent,
        elevation: 4,
        sliderRotate: false,
      ),
      const SizedBox(height: 20),

      // 🔵 Botón circular deslizable
      Container(
        width: 70,
        height: 70,
        child: SlideAction(
          alignment: Alignment.center,
          sliderButtonIcon: const Icon(Icons.arrow_forward, color: Colors.white),
          text: "",
          onSubmit: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Circular activado")),
            );
          },
          innerColor: Colors.deepPurple,
          outerColor: Colors.deepPurple.shade200,
          elevation: 6,
          borderRadius: 50,
        ),
      ),
      const SizedBox(height: 20),

      // 🔷 Botón delgado y horizontal
      SlideAction(
        text: "Desliza para activar",
        onSubmit: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Botón delgado activado")),
          );
        },
        innerColor: Colors.teal,
        outerColor: Colors.teal.shade100,
        borderRadius: 10,
        elevation: 2,
        height: 40,
      ),
    ],
  ),
),


        // Otras pestañas normales
        Center(child: Text('Mis pedidos', style: TextStyle(fontSize: 18))),
        Center(child: Text('Favoritos', style: TextStyle(fontSize: 18))),
        Center(child: Text('Inicio', style: TextStyle(fontSize: 18))),
        Center(child: Text('Ajustes', style: TextStyle(fontSize: 18))),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Menú deslizante")),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Mis contactos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Mis pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Ajustes',
          ),
        ],
      ),
    );
  }
}
