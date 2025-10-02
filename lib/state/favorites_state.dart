import 'package:aula_arquitetura/module/dashboard/core/domain/model/pokemon.dart';

abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<Pokemon> favorites;

  FavoritesLoaded({required this.favorites});
}
