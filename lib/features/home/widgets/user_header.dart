import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_text.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap(30),
            SvgPicture.asset(
              'assets/logo/logo.svg',
              color: AppColors.primary,
              height: 35,
            ),
            Gap(5),
            CustomText(
              title: 'Hi,Mohammed Iyad Al-Lahham',
              color: Colors.grey.shade500,
              weight: FontWeight.w500,
              size: 16,
            ),
          ],
        ),
        Spacer(),
        CircleAvatar(
          radius: 31,
          child: Icon(CupertinoIcons.person, color: Colors.white),
          backgroundColor: AppColors.primary,
        ),
      ],
    );
  }
}
