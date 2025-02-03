import 'package:bookly_app/features/presentation/widgets/details_body.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailsBody(),
    );
  }
}
