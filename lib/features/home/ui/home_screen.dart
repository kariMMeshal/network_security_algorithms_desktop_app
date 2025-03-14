import 'package:flutter/material.dart';
import 'package:network_security_algorithms_app/core/theme/styles.dart';

import 'widgets/choose_desired_algorithm.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Home Screen", style: Styles.font28SoftWhiteBold),
                  SizedBox(height: 50),
                  Center(child: ChooseDesiredAlgorithm()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
