import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonWithIcon extends StatelessWidget {
  const ButtonWithIcon(
      {Key? key,
      required this.icon,
      required this.buttonLabel,
      required this.buttonColor,
      required this.handlePress})
      : super(key: key);

  final IconData icon;
  final String buttonLabel;
  final Color buttonColor;
  final void Function() handlePress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 270,
      child: ElevatedButton.icon(
        onPressed: handlePress,
        icon: FaIcon(icon),
        label: Text(buttonLabel),
        style: ButtonStyle(
          alignment: Alignment.center,
          backgroundColor: MaterialStateProperty.all(buttonColor),
        ),
      ),
    );
  }
}
