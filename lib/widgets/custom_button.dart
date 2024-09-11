import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  void Function()? onTap;
  CustomButton({
    Key? key,
    required this.buttonText,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
      ),
      onPressed: onTap,
      child: SizedBox(
        width: double.infinity,
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}
