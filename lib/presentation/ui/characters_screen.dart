import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_demo/core/models/character.dart';
import 'package:getx_demo/core/services/characters_api.dart';
import 'package:getx_demo/presentation/controllers/characters_controller.dart';
import 'package:getx_demo/presentation/ui/character_details_screen.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetX<CharactersController>(
          builder: (controller) =>
              Text("${controller.favorites.length} favorites"),
        ),
      ),
      body: GetBuilder<CharactersController>(
        //init: CharactersController(charactersApi: Get.find<CharactersApi>()),
        builder: (controller) {
          if (controller.characters == null || controller.characters.isEmpty)
            return Center(
              child: Text("Opps, this looks empty"),
            );
          return CharactersGrid(
            characters: controller.characters,
            onFavoritePressed: (character) =>
                controller.onFavoritePressed(character),
            onItemPressed: (character) => Get.to(
              () => CharacterDetailsScreen(
                character: character,
              ),
              //binding:
            ),
          );
        },
      ),
    );
  }
}

class CharactersGrid extends StatelessWidget {
  const CharactersGrid({
    Key key,
    this.characters,
    this.onFavoritePressed,
    this.onItemPressed,
  }) : super(key: key);

  final List<Character> characters;
  final Function(Character) onFavoritePressed;
  final Function(Character) onItemPressed;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) => CharacterGridElement(
        character: characters[index],
        onFavoritePressed: onFavoritePressed,
        onItemPressed: onItemPressed,
      ),
      itemCount: characters.length,
    );
  }
}

class CharacterGridElement extends StatelessWidget {
  const CharacterGridElement({
    Key key,
    this.character,
    this.onFavoritePressed,
    this.onItemPressed,
  }) : super(key: key);

  final Character character;
  final Function(Character) onFavoritePressed;
  final Function(Character) onItemPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onItemPressed(character),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(character.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: Icon(
              character.favorite ? Icons.bookmark : Icons.bookmark_border,
              color: Colors.red.shade600,
            ),
            onPressed: () => onFavoritePressed(character),
          ),
        ),
      ),
    );
  }
}
