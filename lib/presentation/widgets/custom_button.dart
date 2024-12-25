import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.blue, // Default to blue if not provided
    this.textColor = Colors.white,      // Default to white if not provided
    this.borderColor = Colors.blue,    // Default to blue if not provided
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Makes the button take up full width
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // Button background color
          foregroundColor: textColor,        // Button text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Border radius
            side: BorderSide(
              color: borderColor, // Border color
              width: 2,
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
