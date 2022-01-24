import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bussiness_logic/cubit/characters_cubit.dart';
import 'constants/route_strings.dart';
import 'data/models/characters.dart';
import 'data/repository/characters_repository.dart';
import 'data/web_services/characters_web_services.dart';
import 'presentation/screens/characters_details_screen.dart';
import 'presentation/screens/characters_screen.dart';

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
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          // i'm create  another cubit becouse i cannat use the charactersCubit with other screens.
          //  else if use BlocProvider.value => that means pass the cubit to another screen, but in this case i don't .
          //  so in this case i create another cubit, with the same repository. 
          builder: (_) => BlocProvider(
            create: (BuildContext context) => CharactersCubit(charactersRepository),
            child: CharacterDetailsScreen(
              character: character,
            ),
          ),
        );
    }
  }
}
