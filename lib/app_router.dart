import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/bussiness_logic/cubit/characters_cubit.dart';
import 'package:movies/constants/route_strings.dart';
import 'package:movies/data/repository/characters_repository.dart';
import 'package:movies/data/web_services/characters_web_services.dart';
import 'package:movies/presentation/screens/characters_details_screen.dart';
import 'package:movies/presentation/screens/characters_screen.dart';

class AppRouter {
  // I am take an object from Repository & Cubit to I can pass the cubit to another screen.
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  // Generate the screen route.
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreenRoute:
        return MaterialPageRoute(
          // Create BlocProvider to use the cubit with UI.
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: const CharactersScreen(),
          ),
        );

      case charactersDetailsScreenRoute:
        return MaterialPageRoute(
            builder: (_) => const CharacterDetailsScreen());
    }
  }
}
