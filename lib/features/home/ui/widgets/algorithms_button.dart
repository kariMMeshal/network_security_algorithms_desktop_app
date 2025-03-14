import 'package:flutter/material.dart';

import '../../../../core/theme/colors_manager.dart';
import '../../../../core/theme/styles.dart';

class AlgorithmsButton extends StatefulWidget {
  const AlgorithmsButton({
    super.key,
    required this.title,
    required this.onPress,
  });

  final String title;
  final VoidCallback onPress;

  @override
  AlgorithmsButtonState createState() => AlgorithmsButtonState();
}

class AlgorithmsButtonState extends State<AlgorithmsButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: MediaQuery.of(context).size.width*0.85,
        height: 40,
        decoration: BoxDecoration(
          color:
              isHovered ? ColorsManager.darkCyberBlue : ColorsManager.cyperBlue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextButton(
          onPressed: widget.onPress,
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.all(
              Colors.transparent,
            ), // Remove default ripple effect
          ),
          child: Text(widget.title, style: Styles.font18SoftWhiteSemiBold),
        ),
      ),
    );
  }
}
