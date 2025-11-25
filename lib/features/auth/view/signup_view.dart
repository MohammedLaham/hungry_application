import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_application/core/constants/app_colors.dart';
import 'package:food_application/features/auth/view/login_view.dart';
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
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(200),
              SvgPicture.asset(
                'assets/logo/logo.svg',
                color: AppColors.primary,
              ),

              CustomText(title: 'Welcome to our Food App '),
              Gap(100),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)
                    )
                  ),
                  child: SingleChildScrollView(
                    child : Column(
                      children: [
                        Gap(30),
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

                          hintText: 'Password',
                          isPassword: true,
                          controller: _passwordController,
                        ),

                        Gap(30),
                        //Go To Sign Up
                        CustomAuthButton(
                          color: Colors.transparent,
                          textColor: Colors.white,
                          text: 'Sign Up',
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              print('Success register');
                            }
                          },
                        ),
                        Gap(20),
                        //Go To Login
                        CustomAuthButton(

                          text: 'Go To Login ?',

                          onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (c){
                             return LoginView();
                           }));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
