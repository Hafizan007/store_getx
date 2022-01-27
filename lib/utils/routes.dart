import 'package:digital_store/screens/character_detail_screen.dart';
import 'package:digital_store/screens/character_screen.dart';
import 'package:digital_store/widgets/main/error_widget.dart';
import 'package:get/get.dart';

class Routes {
  static List<GetPage>? getPages = [
    GetPage(name: '/product', page: () => const CharacterScreen()),
    GetPage(
        name: '/detail',
        page: () => const CharacterDetailScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 150)),

    GetPage(name: '/error', page: () => const ErrorScreen()),
    // GetPage(name: '/login', page: () => const LoginScreen()),
    // GetPage(name: '/login', page: () => const LoginScreen()),
  ];
}
