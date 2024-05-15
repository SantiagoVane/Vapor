import 'package:flutter/material.dart';

// Define a custom Form widget.
class FormTextFieldPass extends StatefulWidget {
  const FormTextFieldPass({super.key});

  @override
  State<FormTextFieldPass> createState() => _FormTextFieldPassState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _FormTextFieldPassState extends State<FormTextFieldPass> {
  // ignore: unused_field
  final String _password = '';
  // Create a text controller and use it to retrieve the current value
  // of the TextField.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PASSWORD'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: TextFormField(
            decoration: const InputDecoration(labelText: 'Contraseña'),
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor ingrese su contraseña';
              }
              return null;
            },
          )),
      floatingActionButton: FloatingActionButton(
        // Cuando el usuario presiona el botón, muestra un cuadro de diálogo de alerta que contiene
        // el texto que el usuario ha ingresado en el campo de texto.
        onPressed: () {},
        tooltip: 'Show me the value!',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}
