import 'package:movie_bloc/data/model/charcters.dart';
import 'package:movie_bloc/data/web_services/characters_web%20services.dart';

class CharacterRepository{
  final CharactersWebServices charactersWebServices;

  CharacterRepository(this.charactersWebServices);

  Future <List<dynamic>>getAllCharacters() async{
     final characters = await charactersWebServices.getAllCharacters();
     return characters.map((character) => CharactersModel.fromJson(character)).toList();
  }
}