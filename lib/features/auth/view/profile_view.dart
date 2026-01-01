import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_application/core/constants/app_colors.dart';
import 'package:food_application/core/network/api_error.dart';
import 'package:food_application/features/auth/data/auth_repo.dart';
import 'package:food_application/features/auth/data/user_model.dart';
import 'package:food_application/features/auth/view/login_view.dart';
import 'package:food_application/features/auth/widgets/custom_user_txt_field.dart';
import 'package:food_application/shared/custom_snack.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';
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
  UserModel? userModel;
  AuthRepo authRepo = AuthRepo();

  Future<void> getProfileData() async {
    try {
      final user = await authRepo.getProfileData();
      setState(() {
        userModel = user;
      });
    } catch (e) {
      String errorMsg = 'Error In Profile';
      if (e is ApiError) {
        errorMsg = e.message;
      }
      ScaffoldMessenger.of(context).showSnackBar(CustomSnack(errorMsg));
    }
  }

  @override
  void initState() {
    getProfileData().then((v) {
      print(userModel?.name);
      print(userModel?.email);
      print(userModel?.address);
      print(userModel?.visa);
    });
    if (userModel != null) {
      _name.text = userModel?.name ?? 'Mohammed';
      _email.text = userModel?.email ?? 'prog.khan.2002@gmail.com';
      _address.text = userModel?.address ==null? 'No_Input_Address':userModel!.address!;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, color: Colors.grey.shade800),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
            child: Icon(CupertinoIcons.settings, color: Colors.grey.shade800),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Skeletonizer(
            enabled: userModel == null ,
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image:
                          userModel!.image != null &&
                              userModel!.image!.isNotEmpty
                          ? DecorationImage(
                              image: NetworkImage(userModel!.image!),
                              fit: BoxFit.cover,
                            )
                          : null,
                      border: Border.all(width: 3, color: AppColors.primary),
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
                Gap(30),
                CustomUserTxtField(controller: _name, label: userModel!.name),
                Gap(25),
                CustomUserTxtField(controller: _email, label: userModel!.email),
                Gap(25),
                CustomUserTxtField(
                  controller: _address,
                  label: userModel!.address,
                ),
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
                    title: userModel?.visa ?? "**** **** **** 2342",
                    color: Colors.black,
                    size: 14,
                  ),
                  trailing: CustomText(title: 'Default', color: Colors.black),
                ),
                Gap(400),
              ],
            ),
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
