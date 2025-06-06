import 'package:bookly_app/core/utils/app_route.dart';

import '../../../core/utils/constant_images.dart';
import 'sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimmation();
    navigateToHome();
  }

  void initSlidingAnimmation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 10),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsImages.logo),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
      if(mounted) context.pushReplacementNamed(AppRouter.kHomeView);
      },
    );
  }
}
