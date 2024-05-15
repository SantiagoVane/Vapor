import 'package:clase_virtual/src/7-pokedex/detail_pokemon.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

//definimos la clase pokemon
class Pokemon {
  final String name;
  final String imageUrl;
  final String url;

  Pokemon({
    required this.name,
    required this.imageUrl,
    required this.url,
  });
}

class TablePokemon extends StatefulWidget {
  const TablePokemon({super.key});

  @override
  State<TablePokemon> createState() => _TablePokemonState();
}

class _TablePokemonState extends State<TablePokemon> {
  // se declara la lista de Pokemon como un Future que se inicializa en initState
  late Future<List<Pokemon>> _pokemonList;

  // definimos las url para la paginacion
  String _nextPageUrl = '';
  String _previousPageUrl = '';

  @override
  void initState() {
    super.initState();
    // se obtiene la lista de Pokemon al iniciar
    _pokemonList = fetchPokemonList('https://pokeapi.co/api/v2/pokemon');
  }

  Future<List<Pokemon>> fetchPokemonList(String url) async {
    final response =
        await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // se actualizan las URLs de paginación
      _nextPageUrl = jsonData['next'] ?? '';
      _previousPageUrl = jsonData['previous'] ?? '';

      // Construye la lista de Pokemon a partir de los datos obtenidos
      List<Future<Pokemon>> pokemonList =
          _buildPokemonList(jsonData['results']);

      return await Future.wait(pokemonList);
    } else {
      throw Exception('Problem with Pokémon list');
    }
  }

  List<Future<Pokemon>> _buildPokemonList(List<dynamic> pokemonDataList) {
    return pokemonDataList.map((pokemon) async {
      final pokemonInfo = await fetchPokemonInfo(pokemon['url']);
      return Pokemon(
        name: pokemon['name'],
        imageUrl: pokemonInfo['sprites']['front_default'],
        url: pokemon['url'],
      );
    }).toList();
  }

  // Función para construir una lista de objetos Pokemon a partir de datos de la API
  Future<Map<String, dynamic>> fetchPokemonInfo(String url) async {
    // Obtiene información detallada de un Pokemon y crea un objeto Pokemon
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load Pokémon info');
    }
  }

//funciones de navegacion
  void _previousPage() {
    if (_previousPageUrl.isNotEmpty) {
      setState(() {
        _pokemonList = fetchPokemonList(_previousPageUrl);
      });
    }
  }

  void _nextPage() {
    if (_nextPageUrl.isNotEmpty) {
      setState(() {
        _pokemonList = fetchPokemonList(_nextPageUrl);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokémon List'),
      ),
      body: FutureBuilder<List<Pokemon>>(
        future: _pokemonList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Construcción de la tabla con los datos de los Pokemon
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('Image')),
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text('Actions')),
                      ],
                      rows: snapshot.data!.map((pokemon) {
                        // / Construcción de las filas de la tabla
                        return DataRow(cells: [
                          DataCell(
                            CircleAvatar(
                              backgroundImage: NetworkImage(pokemon.imageUrl),
                            ),
                          ),
                          DataCell(Text(pokemon.name)),
                          DataCell(IconButton(
                            icon: const Icon(Icons.visibility),
                            onPressed: () {
                              // Acción  botón "ver"
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPokemon(
                                    name: pokemon.name,
                                    url: pokemon.url,
                                  ),
                                ),
                              );
                              debugPrint('Ver Pokémon: ${pokemon.name}');
                            },
                          )),
                        ]);
                      }).toList(),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _previousPage,
                      child: const Text('Anterior'),
                    ),
                    ElevatedButton(
                      onPressed: _nextPage,
                      child: const Text('Siguiente'),
                    ),
                  ],
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
