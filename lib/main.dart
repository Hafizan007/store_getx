import 'package:digital_store/screens/character_screen.dart';
import 'package:digital_store/screens/intro_screen.dart';
import 'package:digital_store/utils/routes.dart';
import 'package:digital_store/widgets/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return GetMaterialApp(
        title: 'Character store',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().themeData(context),
        home: box.hasData('firstime')
            ? const CharacterScreen()
            : const OnboarderPage(),
        getPages: Routes.getPages);
  }
}
