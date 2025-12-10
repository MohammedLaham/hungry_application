import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_application/core/constants/app_colors.dart';
import 'package:food_application/core/network/api_error.dart';
import 'package:food_application/features/auth/data/auth_repo.dart';
import 'package:food_application/features/auth/view/signup_view.dart';
import 'package:food_application/root.dart';
import 'package:food_application/shared/custom_button.dart';
import 'package:food_application/shared/custom_text.dart';
import 'package:food_application/shared/custom_txtfield.dart';
import 'package:gap/gap.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  AuthRepo authRepo = AuthRepo();
  @override
  Widget build(BuildContext context) {

    Future<void> login() async {
      setState(() => isLoading = true);
      if (formKey.currentState!.validate()) {
        try {
          final user = await authRepo.login(
            emailController.text.trim(),
            passwordController.text.trim(),
          );
          if (user != null) {
            Navigator.push(context, MaterialPageRoute(builder: (c) => Root()));
          }
          setState(() => isLoading = false);
        } catch (e) {
          setState(() => isLoading = false);
          String errorMessage = 'unhandledError in Login page';
          if (e is ApiError) {
            errorMessage = e.toString();
          }
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(errorMessage)));
        }
      }
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Gap(200),
                SvgPicture.asset(
                  'assets/logo/logo.svg',
                  color: AppColors.primary,
                ),
                Gap(10),
                CustomText(
                  title: 'Welcome Back, Discover The Fast Food',
                  color: AppColors.primary,
                  weight: FontWeight.w500,
                  size: 13,
                ),
                Gap(60),
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
                    child: Column(
                      children: [
                        Gap(30),
                        CustomTxtfield(
                          controller: emailController,
                          hintText: 'Email Address',
                          isPassword: false,
                        ),
                        Gap(15),
                        CustomTxtfield(
                          controller: passwordController,
                          hintText: 'Password',
                          isPassword: true,
                        ),
                        Gap(20),
                        //Login Button
                        isLoading
                            ? CupertinoActivityIndicator(color: Colors.white)
                            : CustomAuthButton(
                                text: 'Login',
                                color: Colors.transparent,
                                onTap: login,
                                textColor: Colors.white,
                              ),
                        Gap(15),
                        //Go To Sign Up
                        CustomAuthButton(
                          text: 'Don\'t have Account?',

                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (c) {
                                  return SignupView();
                                },
                              ),
                            );
                          },
                        ),
                        Gap(20),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) {
                                  return Root();
                                },
                              ),
                            );
                          },
                          child: CustomText(
                            title: 'Continue as a guest',
                            color: Colors.orange,
                            size: 18,
                            weight: FontWeight.bold,
                          ),
                        ),
                      ],
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
