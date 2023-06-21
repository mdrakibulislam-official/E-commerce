import 'package:ecomerce/consts/consts.dart';
import 'package:ecomerce/controllers/auth_controller.dart';
import 'package:ecomerce/views/home_screen/home.dart';
import 'package:ecomerce/widget_common/applogo_widget.dart';
import 'package:ecomerce/widget_common/bg_widget.dart';
import 'package:ecomerce/widget_common/custom_textfield.dart';
import 'package:ecomerce/widget_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());

  // text controller
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordReTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
              child: Column(
                children: [
                  (context.screenHeight * 0.1).heightBox,
                  applogowidget(),
                  10.heightBox,
                  "Join the $appname"
                      .text
                      .fontFamily(bold)
                      .white
                      .size(18)
                      .make(),
                  15.heightBox,
                  SingleChildScrollView(
                    child: Column(children: [
                      customTextField(
                          hint: nameHint,
                          title: name,
                          controller: nameController,isPass:true),
                      customTextField(
                          hint: emailHint,
                          title: email,
                          controller: emailController,isPass:true),
                      customTextField(
                          hint: passwordHint,
                          title: password,
                          controller: passwordController,isPass:true),
                      customTextField(
                          hint: passwordHint,
                          title: retypePassword,
                          controller: passwordReTypeController,isPass:true),
                      Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {}, child: forgetPass.text.make())),
                      5.heightBox,
                      Row(
                        children: [
                          Checkbox(
                            activeColor: redColor,
                            value: isCheck,
                            onChanged: (newValue) {
                              setState(() {
                                isCheck = newValue;
                              });
                            },
                            checkColor: whiteColor,
                          ),
                          10.widthBox,
                          Expanded(
                            child: RichText(
                                text: const TextSpan(children: [
                                  TextSpan(
                                      text: "I agree to the ",
                                      style: TextStyle(
                                          fontFamily: regular, color: fontGrey)),
                                  TextSpan(
                                      text: termAndCondition,
                                      style: TextStyle(
                                          fontFamily: regular, color: redColor)),
                                  TextSpan(
                                      text: " & ",
                                      style: TextStyle(
                                          fontFamily: regular, color: fontGrey)),
                                  TextSpan(
                                      text: privacyPolicy,
                                      style: TextStyle(
                                          fontFamily: regular, color: redColor))
                                ])),
                          )
                        ],
                      ),
                      ourButton(
                          color: isCheck == true ? redColor : lightGrey,
                          textColor: whiteColor,
                          title: signup,
                          onPress: () async {
                            if (isCheck != false) {
                              try {
                                await controller.signupMethod(context: context,
                                    email: emailController.text,
                                    password: passwordController.text).then((value){
                                      return controller.storeUserData(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        name: nameController.text
                                      );
                                }).then((value) {
                                  VxToast.show(context, msg: loggedIn);
                                  Get.offAll(()=>const Home());
                                });

                            }catch(e){
                                auth.signOut();
                                VxToast.show(context, msg: e.toString());
                            }
                          }
                          })
                          .box
                          .width(context.screenWidth - 50)
                          .make(),
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          alreadyHaveAccount.text.color(fontGrey).make(),
                          login.text
                              .color(redColor)
                              .bold
                              .make()
                              .onTap(() {
                            Get.back();
                          })
                        ],
                      ),
                    ])
                        .box
                        .rounded
                        .white
                        .padding(EdgeInsets.all(16))
                        .width(context.screenWidth - 70)
                        .shadowSm
                        .make(),
                  )
                ],
              ),
            )));
  }
}
