import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_application/core/constants/app_colors.dart';
import 'package:food_application/shared/custom_btn.dart';
import 'package:food_application/shared/custom_text.dart';
import 'package:gap/gap.dart';
class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 200),
      child: Container(
        padding: EdgeInsets.all(10),
        height: 200,
         width: 200,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade800,
                blurRadius: 15,
                offset: Offset(0, 0),
              )
            ]
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.primary,
              child: Icon(CupertinoIcons.check_mark,color: Colors.white,size: 30,),

            ),
            Gap(10),
            CustomText(title: 'Success',color: AppColors.primary,),
            CustomText(title: 'Success',),
            CustomBtn(text: 'Closed')
          ],
        ),
      ),
    );
  }
}
