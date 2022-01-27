import 'package:digital_store/controllers/cart_contoller.dart';
import 'package:digital_store/controllers/character_controller.dart';
import 'package:digital_store/widgets/theme/schema.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharacterListWidget extends StatelessWidget {
  const CharacterListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cc = Get.find();
    final CharacterController c = Get.find();
    return Obx(() {
      return c.loading.value
          ? Container()
          : GridView.builder(
              padding: const EdgeInsets.only(right: 20),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 4 / 5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2),
              itemCount: c.list.length,
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    c.getDetail(c.list[i]);
                    Get.toNamed('/detail');
                  },
                  child: SizedBox(
                    width: 155,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 1.5,
                      child: Column(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                // borderRadius: BorderRadius.circular(10.0),
                                child: FancyShimmerImage(
                                  width: double.infinity,
                                  height: 135,
                                  boxFit: BoxFit.cover,
                                  imageUrl: c.list[i].image!,
                                  errorWidget: Image.network(
                                      'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 3),
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          c.list[i].name!,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: boldStyle(15, mycolor: kBlack),
                                        ),
                                        marginHeight(5),
                                        Text(
                                          c.list[i].gender!,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style:
                                              lightStyle(14, mycolor: kBlack),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GetX<CartController>(
                                    init: CartController(),
                                    builder: (controller) {
                                      bool isAdded = controller
                                          .isAlreadyInCart(c.list[i].id);
                                      return GestureDetector(
                                        onTap: () {
                                          if (isAdded) {
                                            cc.removeFromCart(c.list[i].id!);
                                          } else {
                                            cc.addToCart(c.list[i]);
                                          }
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: isAdded
                                                  ? kGreyColor
                                                  : kPrimaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: const Icon(
                                            Icons.add_shopping_cart_sharp,
                                            color: kWhite,
                                            size: 15,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
    });
  }
}
