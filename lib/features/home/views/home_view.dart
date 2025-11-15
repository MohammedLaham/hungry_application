import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_application/core/constants/app_colors.dart';
import 'package:food_application/shared/custom_text.dart';
import 'package:gap/gap.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Gap(75),
            //Header
            Row(
              children: [
                Column(
                  children: [
                    SvgPicture.asset(
                      'assets/logo/logo.svg',
                      color: AppColors.primary,
                      height: 35,
                    ),
                    CustomText(
                      title: 'Hi,Mohammed Iyad Al-Lahham',
                      color: Colors.grey.shade700,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
                Image.asset('assets/splash/splash.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
