import 'package:digital_store/widgets/main/shoppingg_cart_widget.dart';
import 'package:digital_store/widgets/theme/schema.dart';
import 'package:flutter/material.dart';

class CharacterTitleWidget extends StatelessWidget {
  const CharacterTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome back,', style: mediumStyle(17)),
              marginHeight(5),
              Text('Samantha William', style: boldStyle(18)),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 20),
          child: ShoppingCartWidget(type: '0'),
        )
      ],
    );
  }
}
