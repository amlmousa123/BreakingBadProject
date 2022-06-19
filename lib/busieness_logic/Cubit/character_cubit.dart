import 'package:breaking_bad_project/data/model/character.dart';
import 'package:breaking_bad_project/data/repository/character_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'character_states.dart';

class CharacterCubit extends Cubit<CharacterState>{
  CharacterRepository characterRepository ;
   List<Character> characters = [] ;
  CharacterCubit(this.characterRepository) : super(CharacterInitial());

  List<Character> getAllCharacters ()  {
    characterRepository.getAllCharacters().then((characters) {
      emit(CharacterLoaded(characters));
      this.characters =characters ;
    });
    return characters;
  }
  void getQuotes(String charName) {
    characterRepository.getCharacterQuotes(charName).then((quotes) {
      emit(QuotesLoaded(quotes));
    });
  }
  }