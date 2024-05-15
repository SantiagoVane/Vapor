import 'package:clase_virtual/src/7-pokedex/detail_pokemon.dart'; // Importa la página de detalle del Pokémon
import 'package:flutter/material.dart'; // Importa el paquete de widgets de Flutter
import 'package:dio/dio.dart'; // Importa el paquete para realizar solicitudes HTTP

// Clase para representar un Pokémon
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

// Clase para el widget de la tabla de Pokémon utilizando Dio
class TablePokemonDio extends StatefulWidget {
  const TablePokemonDio({super.key});

  @override
  State<TablePokemonDio> createState() => _TablePokemonDioState();
}

class _TablePokemonDioState extends State<TablePokemonDio> {
  late Future<List<Pokemon>>
      _pokemonList; // Future para contener la lista de Pokémon
  final TextEditingController _searchController =
      TextEditingController(); // Controlador para la barra de búsqueda

  @override
  void initState() {
    super.initState();
    _pokemonList = fetchPokemonList(); // Inicia la carga de la lista de Pokémon
  }

  // Método para obtener la lista de Pokémon desde la API
  Future<List<Pokemon>> fetchPokemonList() async {
    final dio = Dio();
    final response = await dio
        .get('https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0');

    if (response.statusCode == 200) {
      final jsonData = response.data;
      List<Pokemon> pokemonList = _buildPokemonList(jsonData['results']);
      return pokemonList;
    } else {
      throw Exception(
          'problemas con la lista pokemon'); // Lanza una excepción si hay un problema con la lista de Pokémon
    }
  }

  // Método para construir la lista de Pokémon a partir de los datos obtenidos
  List<Pokemon> _buildPokemonList(List<dynamic> pokemonDataList) {
    return pokemonDataList.map((pokemon) {
      return Pokemon(
        name: pokemon['name'],
        imageUrl:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${pokemon['url'].split("/")[6]}.png',
        url: pokemon['url'],
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokémon List Dio'), // Título de la aplicación
      ),
      body: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              labelText: 'Buscar Pokémon',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              setState(
                  () {}); // Notifica a Flutter que la interfaz de usuario debe actualizarse cuando cambia el texto de búsqueda
            },
          ),
          Expanded(
            child: FutureBuilder<List<Pokemon>>(
              future: _pokemonList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final searchTerm = _searchController.text.toLowerCase();
                  final filteredPokemonList = snapshot.data!.where((pokemon) {
                    return pokemon.name.toLowerCase().contains(
                        searchTerm); // Filtra la lista de Pokémon según el término de búsqueda
                  }).toList();

                  return ListView.builder(
                    itemCount: filteredPokemonList.length,
                    itemBuilder: (context, index) {
                      final pokemon = filteredPokemonList[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(pokemon.imageUrl),
                        ),
                        title: Text(pokemon.name),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPokemon(
                                name: pokemon.name,
                                url: pokemon.url,
                              ),
                            ),
                          ); // Navega a la página de detalle del Pokémon cuando se toca un Pokémon
                          debugPrint('Ver Pokémon: ${pokemon.name}');
                        },
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                        '${snapshot.error}'), // Muestra un mensaje de error si hay un problema con la carga de datos
                  );
                }
                return const Center(
                  child:
                      CircularProgressIndicator(), // Muestra un indicador de carga mientras se obtienen los datos
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
