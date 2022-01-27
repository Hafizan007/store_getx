import 'package:digital_store/models/character_model.dart';
import 'package:digital_store/services/sql_services.dart';

class ItemServices {
  SQLService sqlService = SQLService();
  List<Results> shoppingList = [];

  Future openDB() async {
    return await sqlService.openDB();
  }

  Future addToCart(Results data) async {
    return await sqlService.addToCart(data);
  }

  Future getCartList() async {
    return await sqlService.getCartList();
  }

  removeFromCart(int shopId) async {
    return await sqlService.removeFromCart(shopId);
  }
}
