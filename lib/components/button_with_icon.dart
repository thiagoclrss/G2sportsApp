import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonWithIcon extends StatelessWidget {
  const ButtonWithIcon(
      {Key? key,
      required this.icon,
      required this.label,
      required this.btnColor,
      required this.width,
      required this.height,
      required this.handlePress})
      : super(key: key);

  final IconData icon;
  final String label;
  final Color btnColor;
  final double width;
  final double height;
  final void Function() handlePress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton.icon(
        onPressed: handlePress,
        icon: FaIcon(icon),
        label: Text(label),
        style: ButtonStyle(
          alignment: Alignment.center,
          backgroundColor: MaterialStateProperty.all(btnColor),
        ),
      ),
    );
  }
}
