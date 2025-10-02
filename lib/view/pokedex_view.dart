import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/pokedex_controller.dart';
import '../../state/pokedex_state.dart';
import '../../core/domain/model/pokemon.dart';
import 'pokemon_detail_view.dart';

class PokedexView extends StatelessWidget {
  const PokedexView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pokédex")),
      body: BlocBuilder<PokedexController, PokedexState>(
        builder: (context, state) {
          if (state is PokedexLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PokedexLoaded) {
            return GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: state.pokemons.length,
              itemBuilder: (_, index) {
                final pokemon = state.pokemons[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            PokemonDetailView(pokemon: pokemon),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(pokemon.imageUrl, height: 80, width: 80),
                        Text(pokemon.displayName),
                        IconButton(
                          icon: Icon(
                            pokemon.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: pokemon.isFavorite ? Colors.red : null,
                          ),
                          onPressed: () {
                            context
                                .read<PokedexController>()
                                .toggleFavorite(pokemon);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is PokedexError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text("Carregando..."));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            context.read<PokedexController>().loadPokemons(limit: 30, offset: 0),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
