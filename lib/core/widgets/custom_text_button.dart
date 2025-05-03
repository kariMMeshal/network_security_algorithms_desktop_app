import 'package:flutter/material.dart';

import '../theme/styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPress,
    required this.title,
  });
  final VoidCallback onPress;
  final String title;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(title, style: Styles.font18SoftWhiteSemiBold),
    );
  }
}
