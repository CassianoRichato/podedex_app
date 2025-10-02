import '../model/pokemon.dart';

abstract class ToggleFavoriteRepository {
  Future<void> call(Pokemon pokemon);
}
