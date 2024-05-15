import 'package:flutter/material.dart';

class CicloVida extends StatefulWidget {
  const CicloVida({super.key});

  @override
  State<CicloVida> createState() => _CicloVidaState();
}

class _CicloVidaState extends State<CicloVida> {
  @override
  //se utiliza para realizar cualquier inicialización necesaria
  //antes de que el widget se dibuje en la pantalla por primera vez.
  void initState() {
    super.initState();
    debugPrint('Estado: Inicialización');
  }

  @override
  //didChangeDependencies()
  //se utiliza para manejar cambios en las dependencias del widget,
  void didChangeDependencies() {
    super.didChangeDependencies();

    debugPrint('Estado: Cambio de dependencias');
  }

  @override
  // es un método clave en Flutter
  // que se utiliza para construir la representación visual del widget.
  Widget build(BuildContext context) {
    debugPrint('Estado: Construcción');

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ciclo de Vida Flutter'),
        ),
        body: const Column(
          children: [
            Center(
              child: Row(
                children: [
                  Text('Hola Mundo '),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  //Cuando un widget es desmontado del árbol de widgets
  //(por ejemplo, porque se ha navegado a otra pantalla
  //y el widget ya no es visible), Flutter llama al método deactivate()
  // para notificar al widget que ya no está en uso y que puede liberar
  //recursos o realizar otras acciones necesarias antes de ser retirado
  //completamente del árbol de widgets.
  void deactivate() {
    super.deactivate();

    debugPrint('Estado: Desactivación');
  }

  @override
  // dispose() es permitir que el widget realice la limpieza final
  // y libere los recursos que ya no son necesarios. Por ejemplo,
  // puedes usar dispose() para cancelar suscripciones a flujos de datos,
  // detener animaciones, liberar memoria asignada dinámicamente u otros recursos
  // que el widget haya adquirido durante su vida útil.
  void dispose() {
    super.dispose();

    debugPrint('Estado: Finalización');
  }

  @override
  // Dentro de reassemble(), puedes realizar cualquier acción necesaria
  // para restablecer el estado del widget o actualizar datos en respuesta
  // a la reasamblea del código. Es importante tener en cuenta que reassemble()
  // se llama solo durante el desarrollo y no se invoca en la versión de producción de la aplicación.
  void reassemble() {
    super.reassemble();

    debugPrint('Estado: Reensamblado');
  }
}
