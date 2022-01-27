import 'package:digital_store/widgets/main/onboard_first_widget.dart';
import 'package:digital_store/widgets/main/onboard_seconde_widget.dart';
import 'package:flutter/material.dart';

class OnboarderPage extends StatefulWidget {
  const OnboarderPage({Key? key}) : super(key: key);

  @override
  _OnboarderPageState createState() => _OnboarderPageState();
}

class _OnboarderPageState extends State<OnboarderPage> {
  final outerScrollController = PageController();
  double innerScrollPosition = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: outerScrollController,
        onPageChanged: (val) {
          setState(() {
            innerScrollPosition = val.toDouble();
          });
        },
        children: [
          OnboardFirst(outerScrollController: outerScrollController),
          const OnboardSecond()
        ],
      ),
    );
  }
}
