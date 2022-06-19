import 'package:breaking_bad_project/data/model/character.dart';
import 'package:breaking_bad_project/data/web_services/character_web_services.dart';

import '../model/quote.dart';

class CharacterRepository{
  final CharactersWebServices charactersWebServices ;

  CharacterRepository(this.charactersWebServices);

  Future<List<Character>> getAllCharacters () async {
    final characters =await charactersWebServices.getAllCharacters();
    return characters .map((character) => Character.fromJson(character)).toList();
  }

  Future<List<Quote>> getCharacterQuotes(String charName) async {
    final quotes = await charactersWebServices.getCharacterQuotes(charName);
    return quotes.map((charQuotes) => Quote.fromJson(charQuotes)).toList();
  }



}