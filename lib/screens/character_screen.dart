import 'package:digital_store/controllers/cart_contoller.dart';
import 'package:digital_store/controllers/character_controller.dart';
import 'package:digital_store/widgets/main/character_filter_widget.dart';
import 'package:digital_store/widgets/main/character_list_widget.dart';
import 'package:digital_store/widgets/main/character_search_widget.dart';
import 'package:digital_store/widgets/main/character_title_widget.dart';
import 'package:digital_store/widgets/theme/schema.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  CharacterController c = Get.put(CharacterController());
  final CartController cc = Get.put(CartController());
  final scrollController = ScrollController();
  int pageKey = 1;

  @override
  void initState() {
    scrollController.addListener(scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
        controller: scrollController,
        children: [
          const CharacterTitleWidget(),
          marginHeight(30),
          const CharacterFilterWidget(),
          marginHeight(20),
          const CharacterSearchWidget(),
          Obx(() {
            return ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                if (c.listIsEmpty.value) const CharacterEmptyWidget(),
                marginHeight(25),
                const CharacterListWidget(),
                if (c.list.isEmpty) marginHeight(50),
                if (c.hasNext.value && !c.listIsEmpty.value)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
              ],
            );
          }),
        ],
      )),
    );
  }

  void scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      if (c.hasNext.value) {
        pageKey = pageKey + 1;
        c.getListCharacter(pageKey.toString());
      }
    }
  }
}

class CharacterEmptyWidget extends StatelessWidget {
  const CharacterEmptyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        marginHeight(50),
        const SizedBox(
          width: double.infinity,
          child: Icon(
            Icons.zoom_out,
            color: kPrimaryColor,
            size: 120,
          ),
        ),
        marginHeight(20),
        Text(
          'Character is empty',
          style: mediumStyle(18),
        )
      ],
    );
  }
}
