import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_application/core/constants/app_colors.dart';
import 'package:food_application/shared/custom_button.dart';
import 'package:food_application/shared/custom_txtfield.dart';
import 'package:gap/gap.dart';

import '../../../shared/custom_text.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _nameController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _passwordConfController = TextEditingController();
    TextEditingController _phoneController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Gap(100),
                SvgPicture.asset('assets/logo/logo.svg'),
                Gap(60),

                CustomTxtfield(
                  hintText: 'Name',
                  isPassword: false,
                  controller: _nameController,
                ),
                Gap(20),
                CustomTxtfield(
                  hintText: 'Email Address',
                  isPassword: false,
                  controller: _emailController,
                ),

                Gap(20),

                CustomTxtfield(
                  hintText: 'Phone Number',
                  isPassword: false,
                  controller: _phoneController,
                ),
                Gap(20),

                CustomTxtfield(
                  hintText: 'Password',
                  isPassword: true,
                  controller: _passwordController,
                ),
                Gap(20),

                CustomTxtfield(
                  hintText: 'Confirm Password',
                  isPassword: true,
                  controller: _passwordConfController,
                ),
                Gap(30),
                CustomAuthButton(
                  text: 'Sign Up',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      print('Success register');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
