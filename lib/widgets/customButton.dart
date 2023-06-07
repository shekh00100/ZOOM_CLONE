import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';

class customButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const customButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
              primary: buttonColor,
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: const BorderSide(color: buttonColor)))),
    );
  }
}
