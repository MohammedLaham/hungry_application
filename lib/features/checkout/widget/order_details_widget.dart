import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../shared/custom_text.dart';

class OrderDetailsWidget extends StatefulWidget {
  const OrderDetailsWidget({super.key, required this.order, required this.taxes, required this.fees, required this.total});
  final String order,taxes,fees,total;


  @override
  State<OrderDetailsWidget> createState() => _OrderDetailsWidgetState();
}

class _OrderDetailsWidgetState extends State<OrderDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        checkoutWidget('Order', widget.order, false, false),
        Gap(10),
        checkoutWidget('Taxes', widget.taxes, false, false),
        Gap(10),
        checkoutWidget('Delivery fees', widget.fees, false, false),
        Gap(10),
        Divider(),
        Gap(10),
        checkoutWidget('Total : ', widget.total, true, false),
        Gap(10),
        checkoutWidget('Estimated delivery time :  ', '15 - 30 mins', true, true),

      ],
    );
  }
}
Widget checkoutWidget(title, price, isBold, isSmall) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomText(
        title: title,
        size: isSmall ? 12 : 15,
        color: isBold ? Colors.black : Colors.grey.shade600,
        weight: isBold ? FontWeight.bold : FontWeight.w400,
      ),
      CustomText(
        title: '$price \$',
        color: isBold ? Colors.black : Colors.grey.shade600,

        size: isSmall ? 12 : 15,
        weight: isBold ? FontWeight.bold : FontWeight.w400,
      ),
    ],
  );
}
