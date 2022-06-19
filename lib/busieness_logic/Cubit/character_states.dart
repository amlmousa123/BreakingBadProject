import 'package:breaking_bad_project/data/model/character.dart';

import '../../data/model/quote.dart';

class CharacterState{}

class CharacterInitial extends CharacterState {}

class CharacterLoaded extends CharacterState {
 final List<Character> characters ;

  CharacterLoaded(this.characters);
}
class QuotesLoaded extends CharacterState {
 final List<Quote> quotes;

 QuotesLoaded(this.quotes);
}

