import 'package:flutter/material.dart';
import 'package:pokedex_app/view/pokedex_view.dart';
import 'core/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'module/pokedex/controller/pokedex_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: BlocProvider(
        create: (_) => getIt<PokedexController>()..loadPokemons(),
        child: const PokedexView(),
      ),
    );
  }
}
