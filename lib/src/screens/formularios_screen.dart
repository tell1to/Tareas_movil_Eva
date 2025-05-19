import 'package:flutter/material.dart';

class FormulariosScreen extends StatefulWidget {
  const FormulariosScreen({super.key});

  @override
  State<FormulariosScreen> createState() => _FormulariosScreenState();
}

class _FormulariosScreenState extends State<FormulariosScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cedulaController = TextEditingController();
  final TextEditingController _nombresController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
  final TextEditingController _fechaController = TextEditingController();
  final TextEditingController _edadController = TextEditingController();

  String? _genero;
  String? _estadoCivil;
  bool _aceptaTerminos = false;

  @override
  void dispose() {
    _cedulaController.dispose();
    _nombresController.dispose();
    _apellidosController.dispose();
    _fechaController.dispose();
    _edadController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _fechaController.text = '${picked.day}/${picked.month}/${picked.year}';
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() && _genero != null && _aceptaTerminos) {
      Navigator.pushNamed(context, '/inicio');
    }
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(),
      filled: true,
      fillColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Cédula
                TextFormField(
                  controller: _cedulaController,
                  keyboardType: TextInputType.number,
                  decoration: _inputDecoration('Cédula'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese su cédula';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // Nombres
                TextFormField(
                  controller: _nombresController,
                  decoration: _inputDecoration('Nombres'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese sus nombres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // Apellidos
                TextFormField(
                  controller: _apellidosController,
                  decoration: _inputDecoration('Apellidos'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese sus apellidos';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // Fecha de nacimiento
                TextFormField(
                  controller: _fechaController,
                  readOnly: true,
                  decoration: _inputDecoration('Fecha de nacimiento').copyWith(
                    suffixIcon: const Icon(Icons.calendar_today),
                  ),
                  onTap: _selectDate,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Seleccione una fecha';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // Edad
                TextFormField(
                  controller: _edadController,
                  keyboardType: TextInputType.number,
                  decoration: _inputDecoration('Edad'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese su edad';
                    }
                    final edad = int.tryParse(value);
                    if (edad == null || edad <= 0) {
                      return 'Edad inválida';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // Género (Radio buttons)
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Género', style: TextStyle(fontWeight: FontWeight.bold)),
                      RadioListTile<String>(
                        title: const Text('Masculino'),
                        value: 'Masculino',
                        groupValue: _genero,
                        onChanged: (val) => setState(() => _genero = val),
                      ),
                      RadioListTile<String>(
                        title: const Text('Femenino'),
                        value: 'Femenino',
                        groupValue: _genero,
                        onChanged: (val) => setState(() => _genero = val),
                      ),
                      if (_genero == null)
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text('Seleccione un género', style: TextStyle(color: Colors.red)),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Estado civil (Dropdown)
                DropdownButtonFormField<String>(
                  decoration: _inputDecoration('Estado civil'),
                  items: const [
                    DropdownMenuItem(value: 'Soltero', child: Text('Soltero')),
                    DropdownMenuItem(value: 'Casado', child: Text('Casado')),
                    DropdownMenuItem(value: 'Divorciado', child: Text('Divorciado')),
                    DropdownMenuItem(value: 'Viudo', child: Text('Viudo')),
                  ],
                  value: _estadoCivil,
                  onChanged: (val) => setState(() => _estadoCivil = val),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Seleccione estado civil';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // Aceptar términos (Checkbox)
                Container(
                  color: Colors.white,
                  child: CheckboxListTile(
                    title: const Text('Acepto términos y condiciones'),
                    value: _aceptaTerminos,
                    onChanged: (val) => setState(() => _aceptaTerminos = val ?? false),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
                if (!_aceptaTerminos)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Debe aceptar términos', style: TextStyle(color: Colors.red)),
                  ),
                const SizedBox(height: 24),
                // Botones
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Salir'),
                    ),
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: const Text('Siguiente'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
