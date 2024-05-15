import 'package:flutter/material.dart';

class Img extends StatelessWidget {
  // Lista de URLs de imágenes
  final List<String> imageUrls = [
    'https://cdn.pixabay.com/photo/2024/04/05/14/47/elephant-8677545_1280.jpg',
    'https://cdn.pixabay.com/photo/2024/04/05/14/47/oldtimer-8677547_960_720.jpg',
    'https://cdn.pixabay.com/photo/2024/04/06/07/19/ai-generated-8678792_1280.jpg',
    'https://cdn.pixabay.com/photo/2024/04/06/07/19/ai-generated-8678792_1280.jpg',
    // Agrega más URLs de imágenes aquí según sea necesario
  ];
  Img({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: const Text('MOSTRAR IMAGENES'),
      ),
      body: ListView.builder(
        itemCount: imageUrls.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 250,
            width: 350,
            child: Image.network(
              imageUrls[index],
              fit: BoxFit.fitWidth,
              scale: 1.9,
            ),
          );
        },
      ),
    );
    // }
  }
}
