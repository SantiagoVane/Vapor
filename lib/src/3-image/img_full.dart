import 'package:flutter/material.dart';

class ImgFull extends StatefulWidget {
  const ImgFull({super.key});

  @override
  State<ImgFull> createState() => _ImgFullState();
}

class _ImgFullState extends State<ImgFull> {
  // Lista de URLs de imágenes
  final List<String> imageUrls = [
    'https://cdn.pixabay.com/photo/2024/04/05/14/47/elephant-8677545_1280.jpg',
    'https://cdn.pixabay.com/photo/2024/04/05/14/47/oldtimer-8677547_960_720.jpg',
    'https://cdn.pixabay.com/photo/2024/04/06/07/19/ai-generated-8678792_1280.jpg',
    'https://cdn.pixabay.com/photo/2024/04/05/14/47/elephant-8677545_1280.jpg',
    'https://cdn.pixabay.com/photo/2024/04/06/07/19/ai-generated-8678792_1280.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: const Text('MOSTRAR IMAGENES'),
      ),
      body: ListView.builder(
        //permite crear elementos de la lista bajo demanda mientras se desplaza.
        itemCount: imageUrls.length,
        //itemBuilder:callback que se llama para construir cada elemento individual del ListView
        itemBuilder: (BuildContext context, int index) {
          //

          //Para cada elemento de la lista,
          //se envuelve en un GestureDetector.
          //Esto permite detectar gestos como clics en el elemento.
          return GestureDetector(
            onDoubleTap: () {
              // Muestra la imagen en una ventana emergente
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: SizedBox(
                      // Establece el ancho de la imagen en el ancho total de la pantalla.
                      width: MediaQuery.of(context).size.width,
                      //Establece la altura de la imagen en la altura total de la pantalla.
                      height: MediaQuery.of(context).size.height,
                      child: Image.network(
                        imageUrls[index],
                        fit: BoxFit.contain,
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cerrar'),
                      ),
                    ],
                  );
                },
              );
            },
            child: SizedBox(
              height: 250,
              width: 350,
              child: Image.network(
                imageUrls[index],
                fit: BoxFit.contain,
                scale: 1.0,
              ),
            ),
          );
        },
      ),
    );
  }
}
