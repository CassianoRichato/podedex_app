import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:pokedex_app/module/pokedex/domain/contract/fetch_pokemons_repository.dart';
import 'package:pokedex_app/module/pokedex/domain/contract/toggle_favorite_repository.dart';
import 'package:pokedex_app/module/pokedex/domain/model/pokemon.dart';

@LazySingleton(as: FetchPokemonsRepository)
class PokemonApiRepository implements FetchPokemonsRepository {
  @override
  Future<List<Pokemon>> call({int limit = 50, int offset = 0}) async {
    final response = await http.get(
      Uri.parse(
        'https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=$offset',
      ),
    );

    if (response.statusCode != 200) throw Exception('Erro na API');

    final data = jsonDecode(response.body);
    final List results = data['results'];

    return results.asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;
      final id = offset + index + 1;
      return Pokemon(
        id: id,
        name: item['name'],
        imageUrl:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png',
      );
    }).toList();
  }
}

@LazySingleton(as: ToggleFavoriteRepository)
class ToggleFavoriteRepositoryImpl implements ToggleFavoriteRepository {
  final List<int> _favorites = [];

  @override
  Future<void> call(Pokemon pokemon) async {
    if (_favorites.contains(pokemon.id)) {
      _favorites.remove(pokemon.id);
      pokemon.isFavorite = false;
    } else {
      _favorites.add(pokemon.id);
      pokemon.isFavorite = true;
    }
  }
}
