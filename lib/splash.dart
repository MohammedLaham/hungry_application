import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_application/core/constants/app_colors.dart';
import 'package:food_application/root.dart';
import 'package:gap/gap.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  // late AnimationController _controller;
  // late Animation<double> _fadeAnimation;
  // late Animation<double> _scaleAnimation;
  // late Animation<Offset> _slideAnimation;
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    //
    // // Animation controller
    // _controller = AnimationController(
    //   vsync: this,
    //   duration: const Duration(seconds: 2),
    // );
    //
    // // Fade animation
    // _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
    //   CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    // );
    //
    // // Scale animation
    // _scaleAnimation = Tween<double>(begin: 0.8, end: 1).animate(
    //   CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    // );
    //
    // // Slide animation for bottom image
    // _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero)
    //     .animate(
    //   CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    // );
    //
    // _controller.forward();
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() => _opacity = 1.0);
    });
    // Navigate after delay
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Root()),
      ),
    );
  }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          curve: Curves.easeInOut,
          duration: Duration(seconds: 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Gap(280),
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.8, end: 1.0),
                duration: Duration(milliseconds: 800),
                curve: Curves.easeOutBack,
                builder: (context, scale, child) =>
                    Transform.scale(scale: scale, child: child),
                child: SvgPicture.asset('assets/logo/logo.svg'),
              ),
              Spacer(),
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 40, end: 0),
                duration: Duration(milliseconds: 900),
                curve: Curves.easeOutCubic,
                builder: (context, value, child) =>
                    Transform.translate(offset: Offset(0, value), child: child),
                child: Image.asset('assets/splash/splash.png'),
              ),
            ],
          ),
        ),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: [
        //     const Gap(250),
        // // LOGO ANIMATION
        // FadeTransition(
        //   opacity: _fadeAnimation,
        //   child: ScaleTransition(
        //     scale: _scaleAnimation,
        //     child: SvgPicture.asset(
        //       'assets/logo/logo.svg',
        //       height: 120,
        //     ),
        //   ),
        // ),
        //
        // const Spacer(),

        // SPLASH IMAGE SLIDE-UP
        // SlideTransition(
        //   position: _slideAnimation,
        //   child: Image.asset(
        //     'assets/splash/splash.png',
        //     height: 250,
        //   ),
        // ),
        //  ],
        //  ),
      ),
    );
  }
}
