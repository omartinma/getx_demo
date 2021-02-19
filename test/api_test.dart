// Import the test package and Counter class
import 'package:get/get.dart';
import 'package:getx_demo/core/services/characters_api.dart';
import 'package:getx_demo/main.dart';
import 'package:test/test.dart';

void main() {
  group('Test the api', () {
    test('Return values with real API(not mockup) without getx', () async {
      final api = CharactersApiImpl();
      final values = await api.getCharacters();
      expect(values.isNotEmpty, true);
    });

    test('Return values with real API(not mockup) with getx', () async {
      AppBindings().dependencies();
      final api = Get.find<CharactersApi>();
      final values = await api.getCharacters();
      expect(values.isNotEmpty, true);
    });
  });
}
