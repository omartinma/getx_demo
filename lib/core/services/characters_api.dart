import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_demo/core/models/character.dart';
import 'package:http/http.dart' as http;

abstract class CharactersApi {
  Future<List<Character>> getCharacters();
}

class CharactersApiImpl extends GetxService implements CharactersApi {
  String mainUrl = "https://rickandmortyapi.com/api/";

  Future<List<Character>> getCharacters() async {
    String apiCharacters = "$mainUrl/character";
    var response = await http.get(apiCharacters);
    var characters = List<Character>();

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var results = jsonResponse['results'] as List;
      characters = results.map((e) => Character.fromMap(e)).toList();
    }
    return characters;
  }
}
