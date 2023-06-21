import 'package:ecomerce/consts/colors.dart';
import 'package:ecomerce/consts/consts.dart';
import 'package:ecomerce/views/auth_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget_common/applogo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => LoginScreen());
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                icSplashBg,
                width: 300,
              ),
            ),
            20.heightBox,
            applogowidget(),
            10.heightBox,
            appname.text.fontFamily(bold).size(22).white.make(),
            5.heightBox,
            appversion.text.white.make(),
            Spacer(),
            credits.text.white.fontFamily(semibold).make(),
            30.heightBox
          ],
        ),
      ),
    );
  }
}
