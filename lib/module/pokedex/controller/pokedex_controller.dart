import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_app/module/pokedex/domain/model/pokemon.dart';
import 'package:pokedex_app/module/pokedex/domain/usecase/fetch_pokemons_usecase.dart';
import 'package:pokedex_app/module/pokedex/domain/usecase/toggle_favorite_usecase.dart';
import 'package:pokedex_app/state/pokedex_state.dart';

@injectable
class PokedexController extends Cubit<PokedexState> {
  final FetchPokemonsUsecase fetchPokemonsUsecase;
  final ToggleFavoriteUsecase toggleFavoriteUsecase;

  PokedexController({
    required this.fetchPokemonsUsecase,
    required this.toggleFavoriteUsecase,
  }) : super(PokedexInitial()) {
    loadPokemons();
  }

  Future<void> loadPokemons({int limit = 50, int offset = 0}) async {
    emit(PokedexLoading());
    try {
      final pokemons = await fetchPokemonsUsecase(limit: limit, offset: offset);
      emit(PokedexLoaded(pokemons: List.from(pokemons)));
    } catch (e) {
      emit(PokedexError(message: e.toString()));
    }
  }

  Future<void> toggleFavorite(Pokemon pokemon) async {
    await toggleFavoriteUsecase(pokemon);

    if (state is PokedexLoaded) {
      final current = state as PokedexLoaded;
      final updatedList = current.pokemons.map((p) {
        if (p.id == pokemon.id) return pokemon;
        return p;
      }).toList();
      emit(PokedexLoaded(pokemons: updatedList));
    }
  }
}
