import 'package:digital_store/controllers/cart_contoller.dart';
import 'package:digital_store/controllers/character_controller.dart';
import 'package:digital_store/widgets/main/shoppingg_cart_widget.dart';
import 'package:digital_store/widgets/theme/schema.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharacterDetailScreen extends StatelessWidget {
  const CharacterDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CharacterController c = Get.find();
    final CartController cc = Get.find();
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kBackgroundColor,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Container(
                height: 35,
                width: 35,
                padding: const EdgeInsets.fromLTRB(10, 5, 3, 5),
                decoration: BoxDecoration(
                    color: kBlueColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(99)),
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 15,
                  color: kBlack,
                ),
              )),
          actions: [
            SizedBox(
              width: 60,
              child: IconButton(
                  onPressed: () => Get.back(),
                  icon: Container(
                      height: 35,
                      width: 35,
                      padding: const EdgeInsets.fromLTRB(7, 7, 5, 5),
                      decoration: BoxDecoration(
                          color: kBlueColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(99)),
                      child: const ShoppingCartWidget(
                        type: '1',
                      ))),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                AspectRatio(
                  aspectRatio: 7 / 8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FancyShimmerImage(
                        boxFit: BoxFit.cover, imageUrl: c.detail.value.image!),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  color: kBackgroundColor,
                  child: Text(
                    c.detail.value.status!,
                    style: boldStyle(17),
                  ),
                )
              ],
            ),
            marginHeight(20),
            Obx(() {
              bool isAdded = cc.isAlreadyInCart(c.detail.value.id);
              return Row(
                children: [
                  Expanded(
                    child: Text(
                      c.detail.value.name!,
                      style: boldStyle(20),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        if (isAdded) {
                          cc.removeFromCart(c.detail.value.id!);
                        }
                      },
                      child: const Icon(Icons.remove),
                      style: buttonStyleV2(kRedColor),
                    ),
                  ),
                  Container(
                    color: kLightBlueColor,
                    width: 30,
                    height: 30,
                    child: Center(
                        child: Text(
                      isAdded ? '1' : '0',
                      style: mediumStyle(15),
                    )),
                  ),
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        if (!isAdded) {
                          cc.addToCart(c.detail.value);
                        }
                      },
                      child: const Icon(Icons.add),
                      style: buttonStyleV2(kGreenColor3),
                    ),
                  ),
                ],
              );
            }),
            marginHeight(20),
            ListTile(
              contentPadding: EdgeInsets.zero,
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              minLeadingWidth: 70,
              leading: Text('Species', style: regularStyle(15)),
              title: Text(c.detail.value.name!, style: regularStyle(15)),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              minLeadingWidth: 70,
              leading: Text('Gender', style: regularStyle(15)),
              title: Text(c.detail.value.gender!, style: regularStyle(15)),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              minLeadingWidth: 70,
              leading: Text('Location', style: regularStyle(15)),
              title:
                  Text(c.detail.value.location!.name!, style: regularStyle(14)),
            ),
          ],
        ),
        bottomNavigationBar: Obx(
          () {
            bool isAdded = cc.isAlreadyInCart(c.detail.value.id);
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  if (isAdded) {
                    cc.removeFromCart(c.detail.value.id!);
                  } else {
                    cc.addToCart(c.detail.value);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.shopping_cart, color: kBackgroundColor),
                    marginWidth(10),
                    Text(isAdded ? 'REMOVE FROM CART' : 'ADD TO CART',
                        style: semiBoldStyle(15.5, mycolor: kBackgroundColor)),
                  ],
                ),
                style: buttonStyle(isAdded ? kGreyColor : kPrimaryColor),
              ),
            );
          },
        ));
  }
}
