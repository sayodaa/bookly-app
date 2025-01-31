import 'package:bookly_app/features/presentation/widgets/splash_body_widget.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashBody(),
    );
  }
}