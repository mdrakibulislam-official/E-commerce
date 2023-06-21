import 'package:ecomerce/consts/consts.dart';
import 'package:ecomerce/consts/lists.dart';
import 'package:ecomerce/views/category_screen/category_details.dart';
import 'package:ecomerce/widget_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        title: categories.text.fontFamily(bold).white.make(),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
            itemCount: 9,
            gridDelegate:
               const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 8, crossAxisSpacing: 8,mainAxisExtent: 200),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset(categoryImages[index],height: 120,width: 200,fit: BoxFit.cover,),
                  10.heightBox,
                  categoriesList[index].text.color(darkFontGrey).align(TextAlign.center).make()

                ],

              ).box.white.rounded.clip(Clip.antiAlias).outerShadow.make().onTap(() {
                Get.to(()=>CategoryDetails(title: categoriesList[index]));
              });
            }),
      ),
    ));
  }
} 
