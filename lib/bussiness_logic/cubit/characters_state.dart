part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

//  state when the app is started, this is the state is necessary
class CharactersInitial extends CharactersState {}

// state when the data is loaded
class CharactersLoaded extends CharactersState {
  final List<Character> character;
  CharactersLoaded(this.character);
}