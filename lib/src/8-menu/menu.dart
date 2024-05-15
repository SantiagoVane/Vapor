import 'package:clase_virtual/src/7-pokedex/table_pokemon.dart';
import 'package:clase_virtual/src/7-pokedex/table_pokemon_dio.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'), // Título de la barra de navegación
      ),
      body: GridView.count(
        crossAxisCount: 2, // Número de columnas en el GridView
        children: [
          // Botón 1: Menu1
          GestureDetector(
            onTap: () {
              // Navega al widget Menu1 cuando se toca este botón
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TablePokemonDio(),
                ),
              );
            },
            child: Card(
              child: _buildMenuItem('assets/menu1.png',
                  'TablePokemon DIO'), // Construye el contenido del botón
            ),
          ),
          // Botón 2: Menu2
          GestureDetector(
            onTap: () {
              // Navega al widget Menu2 cuando se toca este botón
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TablePokemon(),
                ),
              );
            },
            child: Card(
              child: _buildMenuItem('assets/menu2.png',
                  'Table HTTP'), // Construye el contenido del botón
            ),
          ),
        ],
      ),
    );
  }

  // Widget para construir cada elemento del menú
  Widget _buildMenuItem(String imagePath, String text) {
    return Stack(
      alignment: Alignment
          .bottomCenter, // Alinea los elementos en la parte inferior del Stack
      children: [
        Image.asset(
          imagePath, // Ruta de la imagen local
          fit: BoxFit.cover, // Ajusta la imagen al tamaño del contenedor
        ),
        Container(
          color: Colors.black54, // Color de fondo del texto
          padding: const EdgeInsets.symmetric(
              vertical: 8.0), // Espaciado interno del texto
          child: Text(
            text, // Texto debajo de la imagen
            style: const TextStyle(
              color: Colors.white, // Color del texto
              fontSize: 16.0, // Tamaño de fuente del texto
              fontWeight: FontWeight.bold, // fuente del texto
            ),
          ),
        ),
      ],
    );
  }
}
