import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Pokemon {
  final String name;
  final String imageUrl;

  Pokemon({
    required this.name,
    required this.imageUrl,
  });
}

class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  late Future<List<Pokemon>> _pokemonList;

  @override
  void initState() {
    super.initState();
    _pokemonList = fetchPokemonList();
  }

  Future<List<Pokemon>> fetchPokemonList() async {
    final response = await http
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon'))
        .timeout(const Duration(seconds: 5));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      List<Future<Pokemon>> pokemonList =
          _buildPokemonList(jsonData['results']);

      return await Future.wait(pokemonList);
    } else {
      throw Exception('Problema con la Lista POKEMON');
    }
  }

  List<Future<Pokemon>> _buildPokemonList(List<dynamic> pokemonDataList) {
    return pokemonDataList.map((pokemon) async {
      final pokemonInfo = await fetchPokemonInfo(pokemon['url']);
      return Pokemon(
        name: pokemon['name'],
        imageUrl: pokemonInfo['sprites']['front_default'],
      );
    }).toList();
  }

  Future<Map<String, dynamic>> fetchPokemonInfo(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load Pokémon info');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokémon List Api'),
      ),
      body: FutureBuilder<List<Pokemon>>(
        future: _pokemonList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(snapshot.data![index].imageUrl),
                  ),
                  title: Text(snapshot.data![index].name),
                );
              },
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
