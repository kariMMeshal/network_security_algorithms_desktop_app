import 'package:flutter/material.dart';
import 'package:network_security_algorithms_app/core/theme/styles.dart';
import 'package:network_security_algorithms_app/core/widgets/custom_text_button.dart';

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

  void _processText({bool isDecrypt = false}) {
    String encryptedText = caesarCipherAlgorithm(
      text: textController.text,
      key: keyController.text,
      isDecrypt: isDecrypt,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomTextButton(onPress: _processText, title: "Encrypt"),
                  CustomTextButton(
                    onPress: () => _processText(isDecrypt: true),
                    title: "Decrypt",
                  ),
                ],
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
