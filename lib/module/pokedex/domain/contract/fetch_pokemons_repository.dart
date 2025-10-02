import '../model/pokemon.dart';

abstract class FetchPokemonsRepository {
  Future<List<Pokemon>> call({int limit, int offset});
}
