import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_application/core/constants/app_colors.dart';
import 'package:food_application/shared/custom_text.dart';
import 'package:gap/gap.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onAdd;
  final Color colorIcon;

  const ProductCard({
    super.key,
    required this.title,
    required this.image, required this.onAdd, required this.colorIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 90,
            width: 90,
            color: AppColors.primary,
          ),
        ),
        //Image Section
        Positioned(
          top: -40,
          right: -1,
          left: -1,
          child: SizedBox(
            height: 70,
            child: Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              child: Image.asset(image,fit: BoxFit.contain),
            ),
          ),
        ),
        //Bottom section
        Positioned(
          right: 0,
          left: 0,
          bottom: 0,
          child: Padding(padding: EdgeInsets.all(12),
            child: Column(
              children: [
                CustomText(title: title,
                  color: Colors.white,
                  size: 14,
                  weight: FontWeight.w600,),
                Gap(5),
                GestureDetector(
                  onTap: onAdd,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: colorIcon,
                    child: Icon(CupertinoIcons.add,color: Colors.white ,size: 14),
                  ),
                )
              ],
            ),),
        )
      ],
    );


    // Container(
    //   width: 140,
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.circular(20),
    //     boxShadow: [
    //       BoxShadow(
    //         color: Colors.black12,
    //         blurRadius: 5,
    //         offset: Offset(0, 3),
    //       )
    //     ],
    //   ),
    //   child: Column(
    //     children: [
    //       // --- Top Image Section ---
    //       ClipRRect(
    //         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    //         child: Container(
    //           color: Colors.white,
    //           padding: const EdgeInsets.all(12),
    //           child: Image.asset(image, height: 80, fit: BoxFit.contain),
    //         ),
    //       ),
    //
    //       // --- Bottom Section ---
    //       Container(
    //         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    //         decoration: BoxDecoration(
    //           color: Color(0xFF3B2E2E), // Brown color
    //           borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
    //         ),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Text(
    //               title,
    //               style: const TextStyle(
    //                 color: Colors.white,
    //                 fontWeight: FontWeight.w500,
    //                 fontSize: 16,
    //               ),
    //             ),
    //
    //             // (+) Button
    //             Container(
    //               height: 28,
    //               width: 28,
    //               decoration: BoxDecoration(
    //                 color: Colors.red,
    //                 shape: BoxShape.circle,
    //               ),
    //               child: const Icon(Icons.add, size: 18, color: Colors.white),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
