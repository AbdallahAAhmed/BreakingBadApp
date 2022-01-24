import '../models/characters.dart';
import '../models/quote.dart';
import '../web_services/characters_web_services.dart';

//  the main job of the repository it represents the data in a model. 
class CharactersRepository
{
  // take an object from web services class
  final CharactersWebServices charactersWebServices;
  // Constractor
  CharactersRepository(this.charactersWebServices);

  // function to pass the response data from web services to Character Model to be easy when used.
  // I am use the same name between web services and repository 
  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersWebServices.getAllCharacters();
    return characters.map((character) => Character.fromJson(character)).toList();
  }

  Future<List<Quote>> getCharacterQuotes(String charName) async {
    final quotes = await charactersWebServices.getCharacterQuotes(charName);
    return quotes.map((quote) => Quote.fromJson(quote)).toList();
  }
  
}