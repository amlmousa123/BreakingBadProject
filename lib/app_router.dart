import 'package:breaking_bad_project/busieness_logic/Cubit/character_cubit.dart';
import 'package:breaking_bad_project/constants/strings.dart';
import 'package:breaking_bad_project/data/repository/character_repository.dart';
import 'package:breaking_bad_project/presentation/screens/character_details_screen.dart';
import 'package:breaking_bad_project/presentation/screens/character_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/model/character.dart';
import 'data/web_services/character_web_services.dart';

class AppRouter {
  late CharacterRepository characterRepository;
  late CharacterCubit characterCubit;
  AppRouter() {
    characterRepository = CharacterRepository(CharactersWebServices());
    characterCubit = CharacterCubit(characterRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => characterCubit,
            child: CharactersScreen(),
          ),
        );
      case characterDetailsScreen:
        final character = settings.arguments as Character;

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
                CharacterCubit(characterRepository),
            child: CharacterDetailsScreen(
              character: character,
            ),
          ),
        );    }
  }
}
