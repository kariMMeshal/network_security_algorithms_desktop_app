import 'package:flutter/material.dart';
import 'package:network_security_algorithms_app/features/Ceaser%20Cypher/ceaser_cypher_screen.dart';
import 'package:network_security_algorithms_app/features/home/ui/widgets/algorithms_button.dart';

import '../../../../core/theme/styles.dart';
import '../../../Euclidean/euclidean_screen.dart';
import '../../../Simplified DES/simplified_des_screen.dart';

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
          title: "Ceaser Cypher",
          onPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CeaserCypherScreen(),
              ),
            );
          },
        ),
        AlgorithmsButton(
          title: "Euclidean",
          onPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EuclideanScreen()),
            );
          },
        ),
        AlgorithmsButton(
          onPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SimplifiedDESScreen(),
              ),
            );
          },
          title: "Simplified DES",
        ),
      ],
    );
  }
}
