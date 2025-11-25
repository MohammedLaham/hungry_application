import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_application/core/constants/app_colors.dart';
import 'package:gap/gap.dart';

import '../../../shared/custom_text.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.image, required this.text, required this.descreption, required this.rate});
  final String image;
  final String text;
  final String descreption;
  final String rate;
  @override
  Widget build(BuildContext context) {
    return  Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(image,width: 120,height: 120,))   ,
            Gap(15),
            CustomText(title: text,weight: FontWeight.bold,),
            CustomText(title: descreption),
            Row(
              children: [
                CustomText(title: '⭐ $rate'),
                Spacer(),
                Icon(CupertinoIcons.heart_fill,color: AppColors.primary,)
              ],
            ),

          ],
        ),
      ),
    );
  }
}
