import 'package:pokedex_app/module/pokedex/domain/model/pokemon.dart';

abstract class PokedexState {}

class PokedexInitial extends PokedexState {}

class PokedexLoading extends PokedexState {}

class PokedexLoaded extends PokedexState {
  final List<Pokemon> pokemons;

  PokedexLoaded({required this.pokemons});
}

class PokedexError extends PokedexState {
  final String message;

  PokedexError({required this.message});
}
