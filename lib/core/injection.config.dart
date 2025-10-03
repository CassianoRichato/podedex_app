// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pokedex_app/data/repository/pokemon_repository_impl.dart'
    as _i251;
import 'package:pokedex_app/module/pokedex/controller/favorites_controller.dart'
    as _i982;
import 'package:pokedex_app/module/pokedex/controller/pokedex_controller.dart'
    as _i355;
import 'package:pokedex_app/module/pokedex/domain/contract/fetch_pokemons_repository.dart'
    as _i445;
import 'package:pokedex_app/module/pokedex/domain/contract/toggle_favorite_repository.dart'
    as _i544;
import 'package:pokedex_app/module/pokedex/domain/usecase/fetch_pokemons_usecase.dart'
    as _i1000;
import 'package:pokedex_app/module/pokedex/domain/usecase/toggle_favorite_usecase.dart'
    as _i15;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i982.FavoritesController>(() => _i982.FavoritesController());
    gh.lazySingleton<_i445.FetchPokemonsRepository>(
      () => _i251.PokemonApiRepository(),
    );
    gh.lazySingleton<_i544.ToggleFavoriteRepository>(
      () => _i251.ToggleFavoriteRepositoryImpl(),
    );
    gh.factory<_i1000.FetchPokemonsUsecase>(
      () => _i1000.FetchPokemonsUsecase(gh<_i445.FetchPokemonsRepository>()),
    );
    gh.factory<_i15.ToggleFavoriteUsecase>(
      () => _i15.ToggleFavoriteUsecase(gh<_i544.ToggleFavoriteRepository>()),
    );
    gh.factory<_i355.PokedexController>(
      () => _i355.PokedexController(
        fetchPokemonsUsecase: gh<_i1000.FetchPokemonsUsecase>(),
        toggleFavoriteUsecase: gh<_i15.ToggleFavoriteUsecase>(),
      ),
    );
    return this;
  }
}
