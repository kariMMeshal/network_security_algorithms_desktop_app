import 'package:flutter/material.dart';
import 'package:network_security_algorithms_app/features/Ceaser%20Cypher/ceaser_cypher_screen.dart';
import 'package:network_security_algorithms_app/features/home/ui/widgets/algorithms_button.dart';

import '../../../../core/theme/styles.dart';
import '../../../Euclidean/euclidean_screen.dart';

class ChooseDesiredAlgorithm extends StatelessWidget {
  const ChooseDesiredAlgorithm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        const Text(
          "Choose Desired Algorithm",
          style: Styles.font22SoftWhiteBold,
        ),
        AlgorithmsButton(
          onPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CeaserCypherScreen(),
              ),
            );
          },
          title: "Ceaser Cypher",
        ),
        AlgorithmsButton(
          onPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EuclideanScreen()),
            );
          },
          title: "Euclidean",
        ),
      ],
    );
  }
}
