import 'package:digital_store/models/character_model.dart';
import 'package:digital_store/services/item_services.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  ItemServices itemServices = ItemServices();
  final cart = 1.obs;
  final isLoading = false.obs;
  final cartList = <Results>[].obs;
  @override
  void onInit() {
    loadDB();
    super.onInit();
  }

  void counterCart(Results item) {
    cartList.add(item);
  }

  bool isAlreadyInCart(id) {
    return cartList.indexWhere((element) => element.id == id) > -1;
  }

  Future addToCart(Results item) async {
    isLoading(true);
    await itemServices.addToCart(item);
    getCartList();
    isLoading(false);
  }

  void getCartList() async {
    try {
      List list = await itemServices.getCartList();
      cartList.clear();
      for (var element in list) {
        cartList.add(Results.fromDb(element));
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  removeFromCart(int shopId) async {
    itemServices.removeFromCart(shopId);
    int index = cartList.indexWhere((element) => element.id == shopId);
    cartList.removeAt(index);
    update();
  }

  void loadDB() async {
    await itemServices.openDB();
    getCartList();
  }
}
