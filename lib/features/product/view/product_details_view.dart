import 'package:flutter/material.dart';
import 'package:food_application/core/constants/app_colors.dart';
import 'package:food_application/features/product/widgets/spicy_slider.dart';
import 'package:food_application/shared/custom_btn.dart';
import 'package:food_application/shared/custom_text.dart';
import 'package:gap/gap.dart';

import '../widgets/topping_card.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  double value = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpicySlider(
                value: value,
                onChanged: (v) {
                  setState(() => value = v);
                },
              ),
              Gap(50),
              CustomText(title: 'Toppings', size: 20),
              Gap(70),
              SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(4, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ProductCard(
                        colorIcon: Colors.red,
                        title: "Tomato",
                        image: "assets/test/tomote.png",
                        onAdd: () {},
                      ),
                    );
                  }),
                ),
              ),
              Gap(50),
              CustomText(title: 'Side Options', size: 20),
              Gap(70),
              SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(4, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ProductCard(
                        colorIcon: AppColors.primary,
                        title: "Tomato",
                        image: "assets/test/tomote.png",
                        onAdd: () {},
                      ),
                    );
                  }),
                ),
              ),
              Gap(50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(title: 'Total ', size: 15),
                      CustomText(title: '\$ 200.50', size: 24),
                    ],
                  ),
                  CustomBtn(text: 'Add to Cart', onTap: () {}),
                ],
              ),
              Gap(100),


            ],
          ),
        ),
      ),
    );
  }
}
