import 'package:flutter/material.dart';

// Define a custom Form widget.
class FormTextField extends StatefulWidget {
  const FormTextField({super.key});

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

// Definir una clase de estado correspondiente.
// Esta clase contiene los datos relacionados con el Formulario.
class _FormTextFieldState extends State<FormTextField> {
// Crea un controlador de texto y úsalo para recuperar el valor actual
  // del campo de texto.
  final myController = TextEditingController();

  @override
  // El método dispose() es un método de ciclo de vida en Flutter
  // que se llama cuando el widget está siendo eliminado del árbol de widgets.
  // Se utiliza para realizar la limpieza de recursos asociados con el widget.
  void dispose() {
    // Limpiar el controlador cuando se desecha el widget.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrieve Text Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          controller: myController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Cuando el usuario presiona el botón, muestra un cuadro de diálogo de alerta que contiene
        // el texto que el usuario ha ingresado en el campo de texto.
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Recupera el texto que ese usuario ha ingresado usando el
                // Controlador de edición de texto.
                content: Text(myController.text),
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}
