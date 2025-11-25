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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 200),
      child: Container(
        padding: EdgeInsets.all(10),
        height: 400,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade800,
              blurRadius: 15,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.primary,
              child: Icon(
                CupertinoIcons.check_mark,
                color: Colors.white,
                size: 30,
              ),
            ),
            Gap(10),
            CustomText(title: 'Success!', color: AppColors.primary, size: 20,
            weight: FontWeight.bold,),
            Gap(3),
            CustomText(
              title:
                  'your payment successful.\nA receipt for this purchase\nhas been sent to your email',
              color: Colors.grey.shade800,
              size: 15,
            ),
            Gap(25),
            CustomBtn(text: 'Closed',width: 200,onTap: (){
              Navigator.pop(context);
            },),
          ],
        ),
      ),
    );
  }
}
