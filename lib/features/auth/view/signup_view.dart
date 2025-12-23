import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_application/core/constants/app_colors.dart';
import 'package:food_application/core/network/api_error.dart';
import 'package:food_application/features/auth/data/auth_repo.dart';
import 'package:food_application/features/auth/view/login_view.dart';
import 'package:food_application/root.dart';
import 'package:food_application/shared/custom_button.dart';
import 'package:food_application/shared/custom_txtfield.dart';
import 'package:gap/gap.dart';

import '../../../shared/custom_snack.dart';
import '../../../shared/custom_text.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  AuthRepo authRepo = AuthRepo();

  Future<void> signup() async {
    if (formKey.currentState!.validate()) {
      try {
        setState(() => isLoading = true);

        final user = await authRepo.signup(
          _nameController.text.trim(),
          _emailController.text.trim(),
          _passwordController.text.trim(),
        );
        if (user != null) {
          Navigator.push(context, MaterialPageRoute(builder: (c) => Root()));
        }
        setState(() => isLoading = false);
      } catch (e) {
        setState(() => isLoading = false);

        String errMsg = 'Error in Register';
        if (e is ApiError) {
          errMsg = e.message;
        }
        ScaffoldMessenger.of(context).showSnackBar(CustomSnack(errMsg));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
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
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
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
                          isLoading
                              ? CupertinoActivityIndicator()
                              : CustomAuthButton(
                                  color: Colors.transparent,
                                  textColor: Colors.white,
                                  text: 'Sign Up',
                                  onTap: signup,
                                ),
                          Gap(20),
                          //Go To Login
                          CustomAuthButton(
                            text: 'Go To Login ?',

                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (c) {
                                    return LoginView();
                                  },
                                ),
                              );
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
      ),
    );
  }
}
