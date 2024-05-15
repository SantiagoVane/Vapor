import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailPokemon extends StatefulWidget {
  final String name;
  final String url;

  const DetailPokemon({super.key, required this.name, required this.url});

  @override
  State<DetailPokemon> createState() => _DetailPokemonState();
}

class _DetailPokemonState extends State<DetailPokemon> {
  late Future<Map<String, dynamic>> _pokemonInfo;

  @override
  void initState() {
    super.initState();
    _pokemonInfo = fetchPokemonInfo(widget.url);
  }

  Future<Map<String, dynamic>> fetchPokemonInfo(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Problema al Cargar información del Pokemon');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: FutureBuilder(
        future: _pokemonInfo,
        //El Future es una operación asíncrona que representa un valor o un error
        //Por ejemplo, al realizar una solicitud HTTP a una API,
        //obtenemos un Future que contendrá la respuesta de esa solicitud.
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            //la operación aún está en curso.
            return const Center(
                child:
                    CircularProgressIndicator()); // si la operacion aun esta en curso, lo que hace es mostrar un indicador de carga
          }
          if (snapshot.hasError) {
            return Center(
                child: Text(
                    '${snapshot.error}')); //si hubo un error en la peticion HTTP, muestra el error en pantalla
          }
          if (snapshot.hasData) {
            final pokemonInfo = snapshot.data!;
            final List<String> types = [];
            final List<String> abilities = [];
            // Obtener el nombre
            final String name = pokemonInfo['name'];
            // Obtener la imagen más grande
            final String imageUrl = pokemonInfo['sprites']['other']
                ['official-artwork']['front_default'];
            // Obtener los tipos
            pokemonInfo['types'].forEach((type) {
              types.add(type['type']['name']);
            });
            // Obtener las habilidades
            pokemonInfo['moves'].forEach((move) {
              abilities.add(move['move']['name']);
            });

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Mostrar la imagen
                  Center(
                    child: Image.network(
                      imageUrl,
                      width: 200,
                      height: 200,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Nombre: $name',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Tipo: ${types.join(" - ")}', //join, concatena en un string los elementos, los separa por lo que contenga dentro de " "
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Habilidades:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Mostrar la lista de Habilidades
                  Wrap(
                    spacing: 8.0, // Espacio entre los elementos
                    runSpacing: 8.0, // Espacio entre las filas
                    children: abilities.map((ability) {
                      return Chip(
                        label: Text(
                          ability,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: Colors.blue, // Color de fondo del chip
                        elevation: 2, // Elevación del chip
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8), // Espaciado interno del chip
                      );
                    }).toList(),
                  )
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
