import 'package:flutter/material.dart';
import 'package:food_application/shared/custom_btn.dart';
import 'package:gap/gap.dart';
import '../../../shared/custom_text.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 120, top: 40),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/test/test.png', width: 100),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                title: 'Hamburger',
                                weight: FontWeight.bold,
                              ),
                              CustomText(title: 'Qty : X3'),
                              CustomText(
                                title: 'Price : 20\$',
                                weight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gap(20),
                    CustomBtn(text: 'Order Again',
                        color:Colors.grey.shade400,
                        width: double.infinity),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
