import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonWithText extends StatelessWidget {
  const ButtonWithText(
      {Key? key,
      required this.label,
      required this.btnColor,
      required this.txtColor,
      required this.txtSize,
      required this.width,
      required this.height,
      required this.handlePress})
      : super(key: key);

  final String label;
  final Color btnColor;
  final Color txtColor;
  final double txtSize;
  final double width;
  final double height;
  final void Function() handlePress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: handlePress,
        child: Text(
          label,
          style: TextStyle(
            color: txtColor,
            fontSize: txtSize,
          ),
        ),
        style: ButtonStyle(
          alignment: Alignment.center,
          backgroundColor: MaterialStateProperty.all(btnColor),
        ),
      ),
    );
  }
}
