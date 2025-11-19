import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_application/features/home/widgets/card_item.dart';
import 'package:food_application/features/home/widgets/category_food.dart';
import 'package:food_application/features/home/widgets/search_field.dart';
import 'package:food_application/features/home/widgets/user_header.dart';
import 'package:food_application/features/product/view/product_details_view.dart';
import 'package:gap/gap.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List category = ['All', 'Combo', 'Sliders', 'Classic'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            //AppBar
            SliverAppBar(
              elevation: 0,
              scrolledUnderElevation: 0,
              backgroundColor: Colors.white,
              toolbarHeight: 160,
              pinned: true,
              floating: false,
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(top: 38, left: 20, right: 20),
                child: Column(children: [UserHeader(), Gap(10), SearchField()]),
              ),
            ),
            //Search + category
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                child: CategoryFood(
                  selectedIndex: selectedIndex,
                  category: category,
                ),
              ),
            ),
            //Grid View
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(childCount: 6
                    , (context, index,) =>
                    //Card item
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return ProductDetailsView();
                        }));
                      },
                      child: CardItem(
                        image: 'assets/test/test.png',
                        text: 'Cheeseburger',
                        descreption: 'Wendys Burger',
                        rate: '4.9',
                      ),
                    )
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
