import 'package:flutter/material.dart';
import 'package:network_security_algorithms_app/core/theme/styles.dart';
import 'package:network_security_algorithms_app/features/Euclidean/euclidean_algorithm.dart';

import '../../core/widgets/custom_text_field.dart';

class EuclideanScreen extends StatefulWidget {
  const EuclideanScreen({super.key});

  @override
  EuclideanScreenState createState() => EuclideanScreenState();
}

class EuclideanScreenState extends State<EuclideanScreen> {
  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();
  String _outputText = "";

  void _processText() {
    _outputText =
        euclideanAlgorithm(
          a: int.parse(firstController.text),
          b: int.parse(secondController.text),
        ).toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Euclidean Algorithm",
                  style: Styles.font28SoftWhiteBold,
                ),
              ),
              const SizedBox(height: 30),

              Row(
                children: [
                  Column(
                    children: [
                      const Text(
                        'FirstNum',
                        style: Styles.font18SoftWhiteSemiBold,
                      ),
                      const SizedBox(height: 5),
                      CustomTextField(
                        inputController: firstController,
                        width: MediaQuery.of(context).size.width * .4,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      const Text(
                        'SecondNum',
                        style: Styles.font18SoftWhiteSemiBold,
                      ),
                      const SizedBox(height: 5),
                      CustomTextField(
                        inputController: secondController,
                        width: MediaQuery.of(context).size.width * .4,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _processText,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Process",
                    style: Styles.font18SoftWhiteSemiBold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(" GCD: ", style: Styles.font18SoftWhiteSemiBold),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(_outputText, style: Styles.font18SoftWhiteSemiBold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
