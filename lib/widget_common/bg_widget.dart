import 'package:ecomerce/consts/consts.dart';
import 'package:flutter/material.dart';

Widget bgWidget({Widget? child}) {
  return Container(
    decoration: BoxDecoration(
      image:
          DecorationImage(fit: BoxFit.fill, image: AssetImage(imgBackground)),
    ),
    child: child,
  );
}
