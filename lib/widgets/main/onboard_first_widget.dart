import 'dart:ui';

import 'package:digital_store/widgets/theme/schema.dart';
import 'package:flutter/material.dart';

class OnboardFirst extends StatelessWidget {
  const OnboardFirst({
    Key? key,
    required this.outerScrollController,
  }) : super(key: key);

  final PageController outerScrollController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/myimage.jpg'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 230,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      // Clip it cleanly.
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 30),
                          color: Colors.grey.withOpacity(0.1),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'WELCOME',
                                style: boldStyle(30, mycolor: kBackgroundColor),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  outerScrollController.animateToPage(
                                    1,
                                    duration: const Duration(milliseconds: 100),
                                    curve: Curves.linear,
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('LETS STARTED',
                                        style: semiBoldStyle(15.5,
                                            mycolor: kBackgroundColor)),
                                  ],
                                ),
                                style: buttonStyle(kPrimaryColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
