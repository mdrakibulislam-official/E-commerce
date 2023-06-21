import 'package:flutter/material.dart';

import '../../../consts/consts.dart';

Widget featuredButton({String? title, icon}){
  return Row(
    children: [
      Image.asset(icon,width: 60,fit: BoxFit.fill,),
      10.heightBox,

      title!.text.fontFamily(semibold).color(darkFontGrey).make(),

    ],
  ).box.width(200).margin(EdgeInsets.symmetric(horizontal: 4)).roundedSM.padding(const EdgeInsets.all(4.0)).white.outerShadowSm.make();
}