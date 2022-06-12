
import 'package:breaking_bad_project/data/model/character.dart';

class CharacterState{}

class CharacterInitial extends CharacterState {}

class CharacterLoaded extends CharacterState {
 final List<Character> characters ;

  CharacterLoaded(this.characters);
}