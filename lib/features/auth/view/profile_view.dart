import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_application/core/constants/app_colors.dart';
import 'package:food_application/core/network/api_error.dart';
import 'package:food_application/features/auth/data/auth_repo.dart';
import 'package:food_application/features/auth/data/user_model.dart';
import 'package:food_application/features/auth/view/login_view.dart';
import 'package:food_application/features/auth/widgets/custom_user_txt_field.dart';
import 'package:food_application/shared/custom_btn.dart';
import 'package:food_application/shared/custom_snack.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
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
  final TextEditingController _visa = TextEditingController();
  UserModel? userModel;
  String? selectedImage;
  bool isLoading = false;
  AuthRepo authRepo = AuthRepo();

  //get profile
  Future<void> getProfileData() async {
    try {
      final user = await authRepo.getProfileData();
      setState(() {
        userModel = user;
        _name.text = user!.name;
        _email.text = user.email;
        _address.text = user.address ?? 'No Address';
        _visa.text = user.visa ?? '';
      });
    } catch (e) {
      String errorMsg = 'Error In Profile';
      if (e is ApiError) {
        errorMsg = e.message;
      }
      ScaffoldMessenger.of(context).showSnackBar(CustomSnack(errorMsg));
    }
  }

  //pick image
  Future<void> pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      setState(() {
        selectedImage = pickedImage.path;
      });
    }
  }

  //update profile
  Future<void> updateProfileData() async {
    try {
      setState(() => isLoading = true);

      final user = await authRepo.updateProfileData(
        name: _name.text.trim(),
        email: _email.text.trim(),
        address: _address.text.trim(),
        visa: _visa.text.trim(),
        imagePath: selectedImage,
      );
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
          CustomSnack('Profile updated Successfully'));
      setState(() =>
      userModel = user);
    }

    catch (e) {
      setState(() => isLoading = false);

      String errorMsg = 'Failed to update profile';
      if (e is ApiError) {
        errorMsg = e.message;
        ScaffoldMessenger.of(context).showSnackBar(CustomSnack(errorMsg));
        print(errorMsg);
      }
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
    // if (userModel != null) {
    //   _name.text = userModel?.name ?? 'Mohammed';
    //   _email.text = userModel?.email ?? 'prog.khan.2002@gmail.com';
    //   _address.text = userModel?.address ==null? 'No_Input_Address':userModel!.address!;
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.white,
      backgroundColor: AppColors.primary,
      displacement: 50,
      onRefresh: () async {
        await getProfileData();
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            scrolledUnderElevation: 0.0,
            backgroundColor: Colors.white,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back, color: Colors.grey.shade800),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 0,
                ),
                child: Icon(
                  CupertinoIcons.settings,
                  color: Colors.grey.shade800,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: userModel == null
                ? Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            )
                : SingleChildScrollView(
              child: Skeletonizer(
                enabled: userModel == null,
                child: Column(
                  children: [
                    Gap(10),
                    Center(
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: FileImage(File(selectedImage ?? "")),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(
                            width: 3,
                            color: AppColors.primary,
                          ),
                          color: Colors.grey.shade300,
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: selectedImage != null
                            ? Image.file(
                          File(selectedImage!),
                          fit: BoxFit.cover,
                        )
                            : (userModel?.image != null &&
                            userModel!.image!.isNotEmpty)
                            ? Image.network(
                          userModel!.image!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, err, builder) =>
                              Icon(Icons.person),
                        )
                            : Icon(Icons.person),
                      ),
                    ),
                    Gap(10),
                    CustomBtn(
                      onTap: pickImage,
                      text: 'Upload image',
                      width: 138,
                      radius: 50,
                      height: 50,
                    ),
                    Gap(30),
                    CustomUserTxtField(
                      controller: _name,
                      label: userModel!.name,
                    ),
                    Gap(25),
                    CustomUserTxtField(
                      controller: _email,
                      label: userModel!.email,
                    ),
                    Gap(25),
                    CustomUserTxtField(
                      controller: _address,
                      label: userModel!.address,
                    ),
                    Gap(20),
                    Divider(),
                    Gap(10),
                    userModel?.visa == null
                        ? CustomUserTxtField(
                      controller: _visa,
                      textInputType: TextInputType.number,
                      label: 'Add Visa Card ',
                    )
                        : ListTile(
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
                      title: CustomText(
                        title: 'Debit card',
                        color: Colors.black,
                      ),
                      subtitle: CustomText(
                        title:
                        userModel?.visa ??
                            "**** **** **** 2342",
                        color: Colors.black,
                        size: 14.0,
                      ),
                      trailing: CustomText(
                        title: 'Default',
                        color: Colors.black,
                      ),
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
              boxShadow: [
                BoxShadow(color: Colors.grey.shade800, blurRadius: 20),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //Edit Button
                  isLoading ? CupertinoActivityIndicator() :

                  GestureDetector(
                    onTap: updateProfileData,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          CustomText(
                            title: 'Edit Profile',
                            color: Colors.white,
                          ),
                          Gap(5),
                          Icon(CupertinoIcons.pencil, color: Colors.white),
                        ],
                      ),
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
        ),
      ),
    );
  }
}
