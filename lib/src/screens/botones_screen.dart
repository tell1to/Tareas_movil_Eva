import 'package:flutter/material.dart';

class BotonesScreen extends StatefulWidget {
  const BotonesScreen({super.key});

  @override
  State<BotonesScreen> createState() => _BotonesScreenState();
}

class _BotonesScreenState extends State<BotonesScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text('Mis contactos', style: TextStyle(fontSize: 18))),
    Center(child: Text('Mis pedidos', style: TextStyle(fontSize: 18))),
    Center(child: Text('Favoritos', style: TextStyle(fontSize: 18))),
    Center(child: Text('Inicio', style: TextStyle(fontSize: 18))),
    Center(child: Text('Ajustes', style: TextStyle(fontSize: 18))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
