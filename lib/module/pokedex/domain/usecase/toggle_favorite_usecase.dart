import '../contract/toggle_favorite_repository.dart';
import '../model/pokemon.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ToggleFavoriteUsecase {
  final ToggleFavoriteRepository repository;

  ToggleFavoriteUsecase(this.repository);

  Future<void> call(Pokemon pokemon) {
    return repository(pokemon);
  }
}
