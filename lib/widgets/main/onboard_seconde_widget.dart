import 'dart:ui';

import 'package:digital_store/widgets/theme/schema.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardSecond extends StatelessWidget {
  const OnboardSecond({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/myimage2.jpg'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 300,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 30),
                          color: Colors.grey.withOpacity(0.1),
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Digital',
                                style: boldStyle(30, mycolor: kBackgroundColor),
                              ),
                              marginHeight(10),
                              Text(
                                'Character Store',
                                style: boldStyle(30, mycolor: kPrimaryColor),
                              ),
                              marginHeight(25),
                              Text(
                                'The most complete and luxury character store ',
                                style:
                                    regularStyle(15, mycolor: kBackgroundColor),
                              ),
                              marginHeight(30),
                              ElevatedButton(
                                onPressed: () {
                                  box.write('firstime', true);
                                  Get.offAndToNamed('/character');
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('SHOP NOW',
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
