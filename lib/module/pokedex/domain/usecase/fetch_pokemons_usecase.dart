import '../contract/fetch_pokemons_repository.dart';
import '../model/pokemon.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class FetchPokemonsUsecase {
  final FetchPokemonsRepository repository;

  FetchPokemonsUsecase(this.repository);

  Future<List<Pokemon>> call({int limit = 50, int offset = 0}) {
    return repository(limit: limit, offset: offset);
  }
}
