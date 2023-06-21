import 'package:ecomerce/consts/consts.dart';
import 'package:ecomerce/consts/lists.dart';
import 'package:ecomerce/controllers/auth_controller.dart';
import 'package:ecomerce/views/auth_screen/login_screen.dart';
import 'package:ecomerce/views/profile_screen/components/details_card.dart';
import 'package:ecomerce/widget_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              //edit profile button

              Padding(
                padding: const EdgeInsets.all(5.0),
                child: const Align(alignment: Alignment.topRight,
                    child: Icon(Icons.edit, color: whiteColor,)).onTap(() {

                }),
              ),

              //users details section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Image.asset(
                      imgProfile1,
                      width: 80,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make(),
                    10.widthBox,
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Dummy User".text.fontFamily(semibold).white.make(),
                        "customer@example.com".text.white.make(),
                      ],
                    )),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: whiteColor
                        )
                      ),
                        onPressed: () async{
                        await Get.put(AuthController()).signOutMethod(context);
                        Get.offAll(()=>const LoginScreen());
                        },
                        child: logout.text.fontFamily(semibold).white.make())
                  ],
                ),
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  detailsCard(count: "00",title: "in your card",width: context.screenWidth / 3.4),
                  detailsCard(count: "32",title: "in your wishlist",width: context.screenWidth / 3.4),
                  detailsCard(count: "675",title: "in your orders",width: context.screenWidth / 3.4),

                ],
              ),

              //button section

              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index){
                  return Divider(color: lightGrey,);
                },
                  itemCount: profilebuttonList.length,
                  itemBuilder: (BuildContext context, int index){
                return ListTile(
                  leading: Image.asset(profileButtonIcon[index],width: 22,),
                  title: "${profilebuttonList[index]}".text.fontFamily(bold).color(darkFontGrey).make(),
                );
              }).box.white.rounded.margin(EdgeInsets.all(12)).padding(EdgeInsets.symmetric(horizontal: 16)).shadowSm.make().box.color(redColor).make()

            ],
          )),
    ));
  }
}
