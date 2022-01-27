import 'package:digital_store/controllers/character_controller.dart';
import 'package:digital_store/widgets/theme/schema.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharacterFilterWidget extends StatelessWidget {
  const CharacterFilterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: Row(
        children: [
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                filterMethod('All', 0, 60),
                filterMethod('Alive', 1, 80),
                filterMethod('Dead', 2, 80),
                filterMethod('Unknown', 3, 100),
                filterMethod('Human', 4, 90),
                filterMethod('Humanoid', 5, 110),
                filterMethod('Alien', 6, 80),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Obx filterMethod(String title, int option, double width) {
    final CharacterController c = Get.find();
    return Obx(() {
      return InkWell(
        onTap: () {
          c.params.value = title;
          c.option.value = option;
          c.getListCharacter('1');
        },
        child: Container(
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
              color: kGreyColor2, borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 11),
          width: width,
          child: Center(
              child: Text(
            title,
            style: mediumStyle(15,
                mycolor: c.option.value == option ? kBlack : kGreyColor),
          )),
        ),
      );
    });
  }
}
