import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/core/services/characters_api.dart';
import 'package:getx_demo/presentation/ui/characters_screen.dart';

void main() {
  initDependencies();
  runApp(MyApp());
}

void initDependencies() {
  Get.lazyPut<CharactersApi>(() => CharactersApiImpl());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Demo',
      theme: ThemeData(),
      home: CharactersScreen(),
    );
  }
}
