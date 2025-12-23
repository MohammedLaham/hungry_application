import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'custom_text.dart';

SnackBar CustomSnack( errorMessage){
  return    SnackBar(
    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
    margin: EdgeInsets.only(bottom: 30,),
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    clipBehavior: Clip.none,
    backgroundColor: Colors.red.shade900,
    content: Row(
      children: [
        Icon(CupertinoIcons.info),
        Gap(14),
        CustomText(
          title: errorMessage,
          color: Colors.white,
          size: 14,
          weight: FontWeight.w600,
        ),
      ],
    ),
  );
}
