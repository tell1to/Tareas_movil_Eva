import 'package:flutter/material.dart';

class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi App')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // 1. Header personalizado
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage('images/vector-sign-of-user-icon.jpg'),
                  ),
                  SizedBox(height: 12),
                  Text('Usuario Demo', style: TextStyle(color: Color.fromARGB(186, 27, 73, 101), fontSize: 20)),
                ],
              ),
            ),

            // 2. Ítems principales
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/inicio');
              },
            ),

            // 3. Grupo de sección con ExpansionTile
            ExpansionTile(
              leading: const Icon(Icons.arrow_drop_down_circle),
              title: const Text('Tareas Eva'),
              children: [
                ListTile(
                  leading: const Icon(Icons.apps),
                  title: const Text('Botones'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/botones');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.description),
                  title: const Text('Formularios'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/formularios');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'En el siguiente proyecto esta el deber de:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('- Insertar 5 botones; pueden aplicar bootstrap, estos algunos ejemplos; ojo pie de página'),
              SizedBox(height: 4),
              Text('- En el proyecto anterior agregar el menú drawer para su proyecto individual'),
              SizedBox(height: 4),
              Text('- Desarrollar un formulario en flutter en cual tenga los campos de texto, Cédula, Nombres, Apellidos, Fecha de nacimiento, edad, Género, estado civil, etc., incluir los botones siguiente salir, también personalizar con los radio buttons checkbox, aplicar la validación de los campos'),
            ],
          ),
        ),
      ),
    );
  }
}
