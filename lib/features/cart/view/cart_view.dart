import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_application/features/cart/widget/cart_item.dart';
import 'package:food_application/shared/custom_btn.dart';
import 'package:food_application/shared/custom_text.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int itemCount = 20;
  late List<int> quantites;

  @override
  void initState() {
    quantites = List.generate(20, (_) => 1);
    super.initState();
  }

  void onAdd(index) {
    setState(() {
      quantites[index]++;
    });
  }

  void onMinus(index) {
    setState(() {
      if (quantites[index] > 1) {
        quantites[index]--;
      }
    });
  }

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
          itemCount: itemCount,

          itemBuilder: (context, index) {
            return CartItem(
              image: 'assets/test/test.png',
              title: "Hamburger",
              description: "Veggie Burger",
              number: quantites[index],
              onAdd: (){
                onAdd(index);
              },
              onMinus: (){
                onMinus(index);
              },
            );
          },
        ),
      ),

      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(title: 'Total ', size: 16),
                CustomText(title: '\$ 200.50', size: 24),
              ],
            ),
            CustomBtn(text: 'Checkout', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
