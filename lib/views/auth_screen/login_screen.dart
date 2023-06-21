import 'package:ecomerce/consts/consts.dart';
import 'package:ecomerce/consts/lists.dart';
import 'package:ecomerce/controllers/auth_controller.dart';
import 'package:ecomerce/views/auth_screen/signup_screen.dart';
import 'package:ecomerce/views/home_screen/home.dart';
import 'package:ecomerce/widget_common/applogo_widget.dart';
import 'package:ecomerce/widget_common/bg_widget.dart';
import 'package:ecomerce/widget_common/custom_textfield.dart';
import 'package:ecomerce/widget_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(AuthController());


    return bgWidget(child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              applogowidget(),
              10.heightBox,
              "Log in to $appname".text.fontFamily(bold).white.size(18).make(),
              15.heightBox,
              Column(children: [
                customTextField(hint: emailHint, title: email,isPass: false, controller: controller.emailController),
                customTextField(hint: passwordHint, title: password, isPass: true, controller: controller.passwordController),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: forgetPass.text.make())),
                5.heightBox,
                ourButton(
                        color: redColor,
                        textColor: whiteColor,
                        title: login,
                        onPress: () async{
                          await controller.loginMethod(context: context).then((value) {
                            if(value!=null){
                              VxToast.show(context, msg: loggedIn);
                              Get.offAll(()=>Home());
                            }
                            /*else{
                              VxToast.show(context, msg: "Text Field is Empty");
                            }*/
                          });

                        }).box.width(context.screenWidth - 50).make(),
                5.heightBox,
                createNewAccount.text.color(fontGrey).make(),
                5.heightBox,
                ourButton(
                        color: lightGolden,
                        title: signup,
                        textColor: redColor,
                        onPress: () {
                          Get.to(()=>const SignupScreen());
                        }).box.width(context.screenWidth - 50).make(),
                10.heightBox,
                loginWith.text.color(fontGrey).make(),
                5.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: lightGrey,
                              radius: 25,
                              child: Image.asset(
                                socialIconList[index],
                                width: 30,
                              ),
                            ),
                          )),
                )
              ]).box.rounded.white.padding(EdgeInsets.all(16)).width(context.screenWidth - 70).shadowSm.make()
            ],
          ),
        )));
  }
}
