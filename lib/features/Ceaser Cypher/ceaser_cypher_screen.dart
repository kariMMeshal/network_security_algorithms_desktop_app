import 'package:flutter/material.dart';
import 'package:network_security_algorithms_app/core/theme/styles.dart';

import '../../core/widgets/custom_text_field.dart';
import 'ceaser_cypher_algorithm.dart';

class CeaserCypherScreen extends StatefulWidget {
  const CeaserCypherScreen({super.key});

  @override
  CeaserCypherScreenState createState() => CeaserCypherScreenState();
}

class CeaserCypherScreenState extends State<CeaserCypherScreen> {
  final TextEditingController textController = TextEditingController();
  final TextEditingController keyController = TextEditingController();
  String _outputText = "";

  void _processText() {
    String encryptedText = caesarCipherAlgorithm(
      text: textController.text,
      key: keyController.text,
    );
    setState(() {
      _outputText = encryptedText.toUpperCase();
    });
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
                  "Caesar Cipher Algorithm",
                  style: Styles.font28SoftWhiteBold,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Enter your text:",
                style: Styles.font18SoftWhiteSemiBold,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  CustomTextField(inputController: textController),
                  const SizedBox(width: 20),
                  CustomTextField(
                    inputType: const TextInputType.numberWithOptions(),
                    inputController: keyController,
                    width: 80,
                    title: "Key",
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
              const Text(
                "Encrypted Text:",
                style: Styles.font18SoftWhiteSemiBold,
              ),
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
