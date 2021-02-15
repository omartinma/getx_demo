import 'package:get/get.dart';
import 'package:getx_demo/core/models/character.dart';
import 'package:getx_demo/core/services/characters_api.dart';
import 'package:meta/meta.dart';

class CharactersController extends GetxController {
  final CharactersApi charactersApi;
  CharactersController({@required this.charactersApi})
      : assert(charactersApi != null);

  List<Character> characters;
  var favorites = List<Character>().obs;

  @override
  void onReady() async {
    super.onReady();
    characters = await charactersApi.getCharacters();
    update();
  }

  onFavoritePressed(Character character) {
    character.favorite = !character.favorite;
    if (favorites.contains(character))
      favorites.remove(character);
    else
      favorites.add(character);

    update();
  }
}
