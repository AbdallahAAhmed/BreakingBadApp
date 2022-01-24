// ignore_for_file: avoid_print
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies/data/models/characters.dart';
import 'package:movies/data/models/quote.dart';
import 'package:movies/data/repository/characters_repository.dart';
part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Character> characters = [];
  // List<Quote> quotes = [];

  // Constractor
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Character> getAllCharacters()
  {
    charactersRepository.getAllCharacters()
    .then((characters) {
      // state when it's success or loaded.
      emit(CharactersLoaded(characters));
      // pass the characters data from repository to list defined in cubit. 
      this.characters = characters;
    });
    // reutrn the top this.characters.
    return characters;
  }

  // Get the Quotes 
  void getQuotes(String charName)
  {
    charactersRepository.getCharacterQuotes(charName)
    .then((quotes) {
      // state when it's success or loaded.
      emit(QuotesLoaded(quotes));
      // pass the characters data from repository to list defined in cubit. 
      // this.quotes = quotes;
    });
    // reutrn the top this.characters.
    // return quotes;
  }

  

}
