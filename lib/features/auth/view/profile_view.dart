import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_application/core/constants/app_colors.dart';
import 'package:food_application/features/auth/view/login_view.dart';
import 'package:food_application/features/auth/widgets/custom_user_txt_field.dart';
import 'package:gap/gap.dart';

import '../../../shared/custom_text.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _address = TextEditingController();

  @override
  void initState() {
    _name.text = 'Mohammed';
    _email.text = 'prog.khan.2002@gmail.com';
    _address.text = 'Khanyounis';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
            child: Icon(CupertinoIcons.settings, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQytc93VfA29gwZ4w1ySdWjx1CSJBM6qGG3BA&s',
                      ),
                    ),
                    border: Border.all(width: 5, color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade100,
                  ),
                ),
              ),
              Gap(30),
              CustomUserTxtField(controller: _name, label: 'Name'),
              Gap(25),
              CustomUserTxtField(controller: _name, label: 'Email'),
              Gap(25),
              CustomUserTxtField(controller: _name, label: 'Address'),
              Gap(20),
              Divider(),
              Gap(10),
              ListTile(
                // onTap: () => setState(() =>  'Visa'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 16,
                ),
                tileColor: Color(0xffF3F4F6),
                leading: Image.asset(
                  'assets/icon/visa.png',
                  width: 50,
                  color: Colors.blue,
                ),
                title: CustomText(title: 'Debit card', color: Colors.black),
                subtitle: CustomText(
                  title: '**** ****** 0568',
                  color: Colors.black,
                ),
                trailing: CustomText(title: 'Default', color: Colors.black),
              ),
              Gap(400),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey.shade800, blurRadius: 20)],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //Edit Button
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    CustomText(title: 'Edit Profile', color: Colors.white),
                    Gap(5),
                    Icon(CupertinoIcons.pencil, color: Colors.white),
                  ],
                ),
              ),
              //Logout
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.primary),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) {
                              return LoginView();
                            },
                          ),
                        );
                      },
                      child: CustomText(
                        title: 'Logout',
                        color: AppColors.primary,
                      ),
                    ),
                    Gap(5),
                    Icon(Icons.logout, color: AppColors.primary),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
