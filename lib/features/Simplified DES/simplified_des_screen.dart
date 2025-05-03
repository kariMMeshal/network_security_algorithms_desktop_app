import 'package:flutter/material.dart';
import 'package:network_security_algorithms_app/core/theme/styles.dart';
import 'package:network_security_algorithms_app/core/widgets/custom_text_button.dart';

import '../../core/widgets/custom_text_field.dart';
import 'simplified_des_algorithm.dart';

class SimplifiedDESScreen extends StatefulWidget {
  const SimplifiedDESScreen({super.key});

  @override
  SimplifiedDESScreenState createState() => SimplifiedDESScreenState();
}

class SimplifiedDESScreenState extends State<SimplifiedDESScreen> {
  final TextEditingController textController = TextEditingController();
  final TextEditingController keyController = TextEditingController();
  String outputText = "";
  String k1Text = "nan";
  String k2Text = "nan";

  void _processText({bool isDecrypt = false}) {
  if (textController.text.length != 8 || keyController.text.length != 10) {
    setState(() {
      outputText = "Invalid input length";
      k1Text = "nan";
      k2Text = "nan";
    });
    return;
  }
  
  var output;
  if (isDecrypt) {
    output = sdesDecrypt(
      cipher: textController.text,
      key: keyController.text,
    );
    outputText = output['Plain'];
    k1Text = output['K1'];
    k2Text = output['K2'];
  } else {
    output = sdesEncrypt(plain: textController.text, key: keyController.text);
    outputText = output['Cipher'];
    k1Text = output['K1'];
    k2Text = output['K2'];
  }

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
                  "Simplified DES Algorithm",
                  style: Styles.font28SoftWhiteBold,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Enter Plain or Cipher Text :",
                style: Styles.font18SoftWhiteSemiBold,
              ),
              CustomTextField(inputController: textController),
              const SizedBox(height: 20),
              const Text(
                "Enter 10-bit Key : ",
                style: Styles.font18SoftWhiteSemiBold,
              ),
              CustomTextField(inputController: keyController),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomTextButton(onPress: _processText, title: "Encrypt"),
                  CustomTextButton(
                    title: "Decrypt",
                    onPress: () => _processText(isDecrypt: true),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text("Output Text:", style: Styles.font18SoftWhiteSemiBold),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(outputText, style: Styles.font18SoftWhiteSemiBold),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  const Text("K1: ", style: Styles.font18SoftWhiteSemiBold),
                  Container(
                    width: 150,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(k1Text, style: Styles.font18SoftWhiteSemiBold),
                  ),
                  const SizedBox(width: 20),
                  const Text("K2: ", style: Styles.font18SoftWhiteSemiBold),
                  Container(
                    width: 150,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(k2Text, style: Styles.font18SoftWhiteSemiBold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
