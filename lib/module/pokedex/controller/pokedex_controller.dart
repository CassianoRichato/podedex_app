import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../core/domain/model/pokemon.dart';
import '../core/domain/usecase/fetch_pokemons_usecase.dart';
import '../core/domain/usecase/toggle_favorite_usecase.dart';
import '../state/pokedex_state.dart';

@injectable
class PokedexController extends Cubit<PokedexState> {
  final FetchPokemonsUsecase fetchPokemonsUsecase;
  final ToggleFavoriteUsecase toggleFavoriteUsecase;

  PokedexController({
    required this.fetchPokemonsUsecase,
    required this.toggleFavoriteUsecase,
  }) : super(PokedexInitial());

  Future<void> loadPokemons({int limit = 50, int offset = 0}) async {
    emit(PokedexLoading());
    try {
      final pokemons =
          await fetchPokemonsUsecase(limit: limit, offset: offset);
      emit(PokedexLoaded(pokemons: pokemons));
    } catch (e) {
      emit(PokedexError(message: e.toString()));
    }
  }

  Future<void> toggleFavorite(Pokemon pokemon) async {
    await toggleFavoriteUsecase(pokemon);
    if (state is PokedexLoaded) {
      emit(PokedexLoaded(pokemons: List.from((state as PokedexLoaded).pokemons)));
    }
  }
}
