import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:aula_arquitetura/module/favorites/state/favorites_state.dart';
import 'package:aula_arquitetura/module/dashboard/core/domain/model/pokemon.dart';

@injectable
class FavoritesController extends Cubit<FavoritesState> {
  FavoritesController() : super(FavoritesInitial()) {
    _favorites = [];
    emit(FavoritesLoaded(favorites: _favorites));
  }

  late List<Pokemon> _favorites;

  List<Pokemon> get favorites => _favorites;

  void toggleFavorite(Pokemon pokemon) {
    if (_favorites.any((p) => p.id == pokemon.id)) {
      _favorites.removeWhere((p) => p.id == pokemon.id);
    } else {
      _favorites.add(pokemon);
    }
    emit(FavoritesLoaded(favorites: List.from(_favorites)));
  }

  bool isFavorite(Pokemon pokemon) {
    return _favorites.any((p) => p.id == pokemon.id);
  }
}
