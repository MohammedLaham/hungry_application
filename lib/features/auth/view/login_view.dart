import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_application/core/constants/app_colors.dart';
import 'package:food_application/shared/custom_button.dart';
import 'package:food_application/shared/custom_text.dart';
import 'package:food_application/shared/custom_txtfield.dart';
import 'package:gap/gap.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> formKey=GlobalKey<FormState>();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Gap(100),
                  SvgPicture.asset('assets/logo/logo.svg'),
                  Gap(10),
                  CustomText(
                    title: 'Welcome Back, Discover The Fast Food',
                    color: Colors.white,
                    weight: FontWeight.w500,
                    size: 13,
                  ),
                  Gap(60),
                  CustomTxtfield(
                    controller: emailController,
                    hintText: 'Email Address',
                    isPassword: false,
                  ),
                  Gap(20),
                  CustomTxtfield(
                    controller: passwordController,
                    hintText: 'Password',
                    isPassword: true,
                  ),
                  Gap(30),
                  CustomAuthButton(text: 'Login',onTap: (){
                    if(formKey.currentState!.validate()){
                      print('Success login');
                    }
                  },)

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
