import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFieldWithIcon extends StatelessWidget {
  const TextFieldWithIcon({
    Key? key,
    required this.prefixIcon,
    required this.labelText,
    required this.width,
    required this.validator,
    required this.controller,
    required this.keyboardType,
    required this.isObscure,
  }) : super(key: key);

  final IconData prefixIcon;
  final String labelText;
  final double width;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool isObscure;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextFormField(
        obscureText: isObscure,
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade500),
          ),
          labelText: labelText,
          prefixIcon: Icon(prefixIcon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
