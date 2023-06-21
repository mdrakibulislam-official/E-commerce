import 'package:ecomerce/consts/consts.dart';
import 'package:flutter/cupertino.dart';

Widget detailsCard({width, String? count, String? title}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.fontFamily(bold).color(darkFontGrey).size(16).make(),
      5.heightBox,
      title!.text.color(darkFontGrey).make()
    ],
  ).box.white.rounded.width(width).height(80).make();
}