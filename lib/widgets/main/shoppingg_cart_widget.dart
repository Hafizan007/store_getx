import 'package:digital_store/controllers/cart_contoller.dart';
import 'package:digital_store/widgets/theme/schema.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingCartWidget extends StatelessWidget {
  const ShoppingCartWidget({Key? key, required this.type}) : super(key: key);
  final String? type;
  @override
  Widget build(BuildContext context) {
    final CartController c = Get.find();
    return Obx(() {
      return Stack(
        children: <Widget>[
          Icon(
            Icons.shopping_cart,
            size: type == '0' ? 25 : 20,
            color: kBlack,
          ),
          if (c.cartList.isNotEmpty)
            Positioned(
              top: -1.0,
              right: 0.0,
              child: Stack(
                children: <Widget>[
                  Icon(Icons.brightness_1,
                      size: type == '0' ? 17.0 : 16, color: kPrimaryColor),
                  c.cartList.length > 9
                      ? Positioned(
                          top: 2.1,
                          right: 2.5,
                          bottom: 1.0,
                          child: Text(c.cartList.length.toString(),
                              style: mediumStyle(type == '0' ? 11 : 9)),
                        )
                      : Positioned(
                          top: 1.0,
                          right: 5.3,
                          bottom: 1.0,
                          child: Text(c.cartList.length.toString(),
                              style: mediumStyle(type == '0' ? 11 : 10)),
                        ),
                ],
              ),
            )
        ],
      );
    });
  }
}
