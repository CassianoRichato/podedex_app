import 'package:pokedex_app/module/pokedex/domain/model/pokemon.dart';

abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<Pokemon> favorites;

  FavoritesLoaded({required this.favorites});
}
