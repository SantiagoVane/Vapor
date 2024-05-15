import 'package:flutter/material.dart';

class Observer extends StatefulWidget {
  const Observer({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ObserverState createState() => _ObserverState();
}

class _ObserverState extends State<Observer> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    debugPrint('Estado: Inicialización');
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    debugPrint('Estado: Finalización');
  }

  @override
  // se utiliza para manejar cambios en el ciclo de vida de la aplicación.
  // Este método es llamado por el framework de Flutter cuando el estado de
  // la aplicación cambia, por ejemplo, cuando la aplicación pasa de estar activa
  // a estar en pausa, o de estar en pausa a volver a estar activa.
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      // La aplicación se ha minimizado
      debugPrint('La aplicación se ha minimizado');
    } else if (state == AppLifecycleState.resumed) {
      // La aplicación se ha reanudado desde el estado de pausa
      debugPrint('La aplicación se ha reanudado desde el estado de pausa');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Lifecycle Demo'),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}
