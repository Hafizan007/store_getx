import 'package:digital_store/controllers/character_controller.dart';
import 'package:digital_store/widgets/theme/schema.dart';
import 'package:digital_store/widgets/theme/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharacterSearchWidget extends StatelessWidget {
  const CharacterSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CharacterController c = Get.find();
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: TextFieldInput(
                onSubmit: (value) {
                  c.search.value = value;
                  c.getListCharacter('1');
                },
                textEditingController: c.searchController.value,
                hintText: 'Search character',
                textInputType: TextInputType.name),
          ),
          marginWidth(15),
          Container(
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
                color: kWhite, borderRadius: BorderRadius.circular(15)),
            child: IconButton(
                onPressed: () {
                  c.search.value = c.searchController.value.text;
                  c.getListCharacter('1');
                },
                icon: const Icon(
                  Icons.check_circle_rounded,
                  color: kBlack,
                )),
          )
        ],
      ),
    );
  }
}
