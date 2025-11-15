import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.title,
     this.color,
     this.weight,
     this.size,
  });

  final String title;
  final Color? color;
  final FontWeight? weight;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: size, color: color, fontWeight: weight),
    );
  }
}

//''
