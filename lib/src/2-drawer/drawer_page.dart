import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    // String textoPrincipal;
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Principal'),
      ),
      //Agrega un cajón a la aplicación y lo envuelve  en un widget de Scaffold.
      drawer: Drawer(
        // Agrega un ListView al Drawer. Esto asegura que el usuario pueda desplazarse
        // a través de las opciones si no caben en la pantalla.
        child: ListView(
          // Importante: elimina cualquier padding del ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menú Principal'),
            ),
            ListTile(
              title: const Text('Opción 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.wifi),
              title: const Text('Wi-Fi'),
              // subtitle: const Text('Conéctate a una red'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Actualiza el estado de la app
                //
                // Luego cierra el drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('texto'),
      ),
    );
  }
}
