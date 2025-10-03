import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/module/pokedex/controller/favorites_controller.dart';
import 'package:pokedex_app/state/favorites_state.dart';
import 'package:pokedex_app/view/pokemon_detail_view.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favoritos")),
      body: BlocBuilder<FavoritesController, FavoritesState>(
        builder: (context, state) {
          if (state is FavoritesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FavoritesLoaded) {
            final favoritos = state.favorites;
            if (favoritos.isEmpty) {
              return const Center(child: Text("Nenhum Pokémon favoritado."));
            }
            return ListView.builder(
              itemCount: favoritos.length,
              itemBuilder: (context, index) {
                final pokemon = favoritos[index];
                return ListTile(
                  leading: Image.network(
                    pokemon.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  title: Text(pokemon.name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PokemonDetailView(pokemon: pokemon),
                      ),
                    );
                  },
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
