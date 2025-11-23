import 'package:flutter/material.dart';
import 'package:food_application/core/constants/app_colors.dart';
import 'package:food_application/features/checkout/widget/order_details_widget.dart';
import 'package:food_application/features/checkout/widget/success_dialog.dart';
import 'package:food_application/shared/custom_text.dart';
import 'package:gap/gap.dart';

import '../../../shared/custom_btn.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  String selectedMethod = 'Cash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                title: 'Order Summary',
                size: 20,
                weight: FontWeight.w500,
              ),
              Gap(10),
              OrderDetailsWidget(
                order: '18.8',
                taxes: '3.5',
                fees: '2.4',
                total: '100',
              ),
              Gap(80),
              CustomText(
                title: 'Payment methods',
                size: 20,
                weight: FontWeight.w500,
              ),
              Gap(15),
              //Cash
              ListTile(
                onTap: () => setState(() => selectedMethod = 'Cash'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                tileColor: Color(0xff3C2F2F),
                leading: Image.asset('assets/icon/cash.png', width: 50),
                title: CustomText(
                  title: 'Cash on Delivery ',
                  color: Colors.white,
                ),
                trailing: Radio<String>(
                  activeColor: Colors.white,
                  value: 'Cash',
                  groupValue: selectedMethod,
                  onChanged: (v) => setState(() => selectedMethod = v!),
                ),
              ),
              Gap(10),
              //Debit
              ListTile(
                onTap: () => setState(() => selectedMethod = 'Visa'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
                tileColor: Colors.blue.shade900,
                leading: Image.asset(
                  'assets/icon/visa.png',
                  width: 50,
                  color: Colors.white,
                ),
                title: CustomText(title: 'Debit card', color: Colors.white),
                subtitle: CustomText(
                  title: '**** ****** 0568',
                  color: Colors.white,
                ),
                trailing: Radio<String>(
                  activeColor: Colors.white,
                  value: 'Visa',
                  groupValue: selectedMethod,
                  onChanged: (v) => setState(() => selectedMethod = v!),
                ),
              ),
              Gap(5),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (v) {},
                    activeColor: AppColors.primary
                  ),
                  CustomText(title: 'Save card details for future payments'),
                ],
              ),

            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade800,
              blurRadius: 15,
              offset: Offset(0, 0),
            )
          ]
        ),
        child:   Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(title: 'Total ', size: 15),
                  CustomText(title: '\$ 200.50', size: 24),
                ],
              ),
              CustomBtn(text: 'Pay Now ', onTap: () {
                showDialog(context: context, builder: (_){
                  return SuccessDialog();
                });

              }),
            ],
          ),
        ),
      ),
    );
  }
}
