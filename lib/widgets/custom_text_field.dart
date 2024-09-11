import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final Function(String)? onChange;
  TextInputType? keyboardType;
  bool obscureText;
  CustomTextFormFieldWidget(
      {Key? key,
      required this.hintText,
      this.keyboardType,
      this.onChange,
      this.obscureText = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChange,
      style: TextStyle(
        decorationThickness: 0,
        color: Colors.black,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.blue),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
