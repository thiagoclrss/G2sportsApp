import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWithIcon extends StatelessWidget {
  const TextFieldWithIcon({
    Key? key,
    required this.prefixIcon,
    required this.labelText,
    required this.width,
    required this.validator,
    required this.controller,
    required this.keyboardType,
    this.isObscure,
    this.hintText,
    this.inputFormatters,
  }) : super(key: key);

  final IconData prefixIcon;
  final String labelText;
  final double width;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool? isObscure;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextFormField(
        inputFormatters: inputFormatters ?? [],
        obscureText: isObscure ?? false,
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText ?? '',
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
