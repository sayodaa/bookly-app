import 'package:bookly_app/core/constants/constant_images.dart';
import 'package:bookly_app/core/constants/strings.dart';
import 'package:bookly_app/features/presentation/views/home_view.dart';
import 'package:bookly_app/features/presentation/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
}
  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(
        () => const HomeView(),
        transition: Transition.rightToLeft,
        duration: kSplashDuration,
      );
    });
  }
