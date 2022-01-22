// ignore_for_file: avoid_print
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies/data/models/characters.dart';
import 'package:movies/data/repository/characters_repository.dart';
part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Character> characters = [];

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

  

}
