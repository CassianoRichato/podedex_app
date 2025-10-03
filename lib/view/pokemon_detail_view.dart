import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/module/pokedex/controller/favorites_controller.dart';
import 'package:pokedex_app/module/pokedex/domain/model/pokemon.dart';

class PokemonDetailView extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailView({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
        actions: [
          BlocBuilder<FavoritesController, dynamic>(
            builder: (context, state) {
              final controller = context.read<FavoritesController>();
              final isFav = controller.isFavorite(pokemon);
              return IconButton(
                icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
                onPressed: () {
                  controller.toggleFavorite(pokemon);
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.network(
                pokemon.imageUrl,
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              pokemon.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 12),
            Text("ID: ${pokemon.id}"),
            Text("Tipo: ${pokemon.runtimeType}"),
          ],
        ),
      ),
    );
  }
}
