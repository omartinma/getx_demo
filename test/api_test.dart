// Import the test package and Counter class
import 'package:getx_demo/core/services/characters_api.dart';
import 'package:test/test.dart';

void main() {
  group('Test the api', () {
    test('Return values', () async {
      final api = CharactersApiImpl();
      final values = await api.getCharacters();
      expect(values.isNotEmpty, true);
    });
  });
}
