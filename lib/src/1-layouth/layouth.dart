import 'package:clase_virtual/src/1.1-buttons/action_button.dart';
import 'package:flutter/material.dart';

//quinto commit
//cuarto comit jmc
//Tercer commit vanegas cum master
//Segundo commit
//#3
//Widgets con estado o StatefulWidgets
//Son todos los widgets con los que el usuario de la aplicación
// puede tener una interacción directa

class Layouth extends StatefulWidget {
  const Layouth({super.key});

//@override: Esta anotación indica que el método createState()
// está sobrescribiendo un método definido en la clase base (StatefulWidget).
// Es una buena práctica y ayuda a asegurar que estás
//correctamente sobrescribiendo el método.

  @override
  State<Layouth> createState() => _LayouthState();
}

class _LayouthState extends State<Layouth> {
  int contador = 0;
  int contadorMenos = 0;
  // Mantén el índice del ítem seleccionado aquí

  // Método para cambiar el índice seleccionado
  /*void _onItemTapped(int index) {
    setState(() {
       contador = contador+index;
    });
    // Aquí también puedes añadir más lógica basada en el índice seleccionado
    // Por ejemplo, navegar a diferentes pantallas o mostrar diferentes contenidos
  }*/
  @override
  Widget build(BuildContext context) {
    //Scafold - implementa un diseño de Material
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: const Text('Contador'),
      ),
      body: Column(
        children: [
          Center(
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
              ],
            ),
          ),
          Center(
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
                const Text('Clics'),
                const Text('Clics')
                // Text('Clic${contador > 1 ? 's':' '}')
              ],
            ),
          ),
          Center(
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
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          actionButtons(), // widget local
          ActionButtonExt(
            icon: Icons.exposure_minus_1_outlined,
            onPressed: () {
              contador++;
            },
          ),
          ActionButtonExt(
            icon: Icons.abc_sharp,
            onPressed: () {
              setState(() {
                contador--;
              });
            },
          ),
          botones2(),
          botones2(),
          //widget externo
        ],
      ),
    );
  }

  FloatingActionButton botones2() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          contador--;
        });
      },
      child: const Icon(Icons.remove_circle_outline),
    );
  }

  FloatingActionButton actionButtons() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          contador--;
        });
      },
      child: const Icon(Icons.remove_circle_outline),
    );
  }
}
