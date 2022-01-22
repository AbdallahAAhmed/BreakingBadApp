import 'package:movies/data/models/characters.dart';
import 'package:movies/data/web_services/characters_web_services.dart';

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
  
}