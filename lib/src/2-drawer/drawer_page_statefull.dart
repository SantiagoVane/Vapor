import 'package:flutter/material.dart';

class DrawerPageStateFull extends StatefulWidget {
  const DrawerPageStateFull({super.key});

  @override
  State<DrawerPageStateFull> createState() => _DrawerPageStateFullState();
}

class _DrawerPageStateFullState extends State<DrawerPageStateFull> {
  String textoPrincipal = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(textoPrincipal),
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
              child: Text('Menú Principal1'),
            ),
            ListTile(
              title: const Text('Opción 1'),
              onTap: () {
                setState(() {
                  textoPrincipal = 'Opción 1';
                });
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
                setState(() {
                  textoPrincipal = 'Wi-Fi';
                });
                // Luego cierra el drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(textoPrincipal),
      ),
    );
  }
}
