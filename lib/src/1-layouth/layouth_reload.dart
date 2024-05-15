import 'package:clase_virtual/src/1.1-buttons/button_app_bar.dart';
import 'package:flutter/material.dart';

//#2
//Widgets con estado o StatefulWidgets
//Son todos los widgets con los que el usuario de la aplicación
// puede tener una interacción directa

class LayouthReload extends StatefulWidget {
  const LayouthReload({super.key});

//La anotación @override se utiliza en Dart para indicar que un método
//en una subclase está sobrescribiendo un método de la superclase.
//En el contexto de Flutter y la programación de widgets,
//esta anotación se usa comúnmente cuando se está creando un nuevo widget
//mediante la extensión de StatefulWidget.

  @override
  State<LayouthReload> createState() => _LayouthReloadState();
}

class _LayouthReloadState extends State<LayouthReload> {
  int contador = 0;
  // String mensaje = 'Clic';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Colors.green[300],
          title: const Text('Contador UCEVA - Reload'),
          //la propiedad "leading" es útil para agregar contenido adicional,
          //como íconos, texto o widgets, a la izquierda
          leading: IconButton(
            icon: const Icon(Icons.replay_outlined),
            onPressed: () {
              setState(() {
                contador = 0;
              });
            },
          ),
          actions: [
            ButtonAppBar(
              icon: const Icon(Icons.abc_outlined),
              onPressed: () {
                setState(() {
                  contador--;
                });
              },
            ),
            ButtonAppBar(
              icon: const Icon(Icons.access_alarms_rounded),
              onPressed: () {
                setState(() {
                  contador++;
                });
              },
            ),
            buttonsAppBar(),
            buttonsAppBar(),
          ]),
      body: Center(
        child: Column(
          //La propiedad mainAxisAlignment se utiliza en Flutter para controlar
          //la alineación de los widgets secundarios dentro de un widget contenedor
          //que utiliza un diseño basado en un eje principal, como Row o Column.
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$contador',
              style: const TextStyle(fontSize: 140),
            ),
            const Text('Clics')
            // Text('Clic${contador > 1 ? 's':' '}')
            // Text((mensaje))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //setState() es un método fundamental en Flutter
          //que se utiliza para notificar al framework que el estado
          //interno de un widget ha cambiado y que necesita ser reconstruido.
          setState(() {
            //
            contador++; //
          });
        },
        child: const Icon(Icons.plus_one_outlined),
      ),
    );
  }

  IconButton buttonsAppBar() {
    return IconButton(
      icon: const Icon(Icons.minimize),
      onPressed: () {
        setState(() {
          contador--;
        });
      },
    );
  }

  // IconButton newMethod() {
  //   return IconButton(
  //     icon: const Icon(Icons.add),
  //     onPressed: () {
  //       setState(() {
  //         contador++;
  //       });
  //     },
  //   );
  // }
}
