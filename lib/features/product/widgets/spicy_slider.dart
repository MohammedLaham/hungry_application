import 'package:flutter/material.dart';
import 'package:gap/gap.dart' show Gap;

import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_text.dart';

class SpicySlider extends StatefulWidget {
  const SpicySlider({super.key, required this.value, required this.onChanged});
  final double value;
  final ValueChanged<double> onChanged;

  @override
  State<SpicySlider> createState() => _SpicySliderState();
}

class _SpicySliderState extends State<SpicySlider> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/detail/product_detailes.png', width: 140),
        Spacer(),
        Column(
          children: [
            CustomText(
              title:
              'Customize Your Burger\nto Your Tastes.\nUltimate Experience',
            ),
            Slider(
              min: 0,
              max: 1,
              value: widget.value,
              onChanged:widget.onChanged,
              activeColor: AppColors.primary,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(title: '🥶'),
                Gap(100),
                CustomText(title: '️🌶️')
              ],
            )
          ],
        ),
      ],
    );
  }
}
