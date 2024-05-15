import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final _formKey = GlobalKey<FormState>();
  String _nombre = '';
  String _email = '';
  // ignore: unused_field
  String _password = '';
  late DateTime _fechaNacimiento;
  bool _generoMasculino = true;
  final List<String> _intereses = [];
  bool _terminosAceptados = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nombre'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese su nombre';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _nombre = value!;
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Correo electrónico'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese su correo electrónico';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Contraseña'),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese su contraseña';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _password = value!;
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Fecha de nacimiento'),
                  readOnly: true,
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    ).then((date) {
                      setState(() {
                        _fechaNacimiento = date!;
                      });
                    });
                  },
                  validator: (value) {
                    return null;
                  },
                ),
                Row(
                  children: <Widget>[
                    const Text('Género: '),
                    Radio(
                      value: true,
                      groupValue: _generoMasculino,
                      onChanged: (value) {
                        setState(() {
                          _generoMasculino = value!;
                        });
                      },
                    ),
                    const Text('Masculino'),
                    Radio(
                      value: false,
                      groupValue: _generoMasculino,
                      onChanged: (value) {
                        setState(() {
                          _generoMasculino = value!;
                        });
                      },
                    ),
                    const Text('Femenino'),
                  ],
                ),
                const Text('Intereses: '),
                CheckboxListTile(
                  title: const Text('Deportes'),
                  value: _intereses.contains('Deportes'),
                  onChanged: (value) {
                    setState(() {
                      _intereses.remove('Deportes');
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Arte'),
                  value: _intereses.contains('Arte'),
                  onChanged: (value) {
                    setState(() {
                      _intereses.add('Arte');
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Viajes'),
                  value: _intereses.contains('Viajes'),
                  onChanged: (value) {
                    setState(() {
                      _intereses.add('Viajes');
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Acepto los términos y condiciones'),
                  value: _terminosAceptados,
                  onChanged: (value) {
                    setState(() {
                      // _terminosAceptados = value;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        mostrarDialogo();
                      }
                    },
                    child: const Text('OK'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void mostrarDialogo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Información del formulario'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Nombre: $_nombre'),
                Text('Correo electrónico: $_email'),
                Text('Fecha de nacimiento: ${_fechaNacimiento.toString()}'),
                Text('Género: ${_generoMasculino ? 'Masculino' : 'Femenino'}'),
                Text('Intereses: ${_intereses.join(', ')}'),
                Text('Términos aceptados: ${_terminosAceptados ? 'Sí' : 'No'}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}
