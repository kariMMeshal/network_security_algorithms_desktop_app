import 'package:flutter/material.dart';
import 'package:network_security_algorithms_app/core/theme/styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.inputController,
    this.width,
    this.title,
    this.inputType,
  });

  final TextEditingController inputController;
  final double? width;
  final String? title;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width * .8,
      child: TextField(
        keyboardType: inputType ?? TextInputType.text,
        controller: inputController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[900],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          hintText: title ?? "Type here...",
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
        style: Styles.font18SoftWhiteSemiBold,
      ),
    );
  }
}
