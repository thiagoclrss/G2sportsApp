import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:g2sports/components/button_with_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/g2sportslogo.png",
                width: 250,
                height: 250,
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ButtonWithIcon(
                  icon: FontAwesomeIcons.facebook,
                  buttonLabel: "Entrar com facebook",
                  buttonColor: Colors.blue.shade700,
                  handlePress: () {
                    print("Entrar com facebook");
                  }),
              SizedBox(height: 20),
              ButtonWithIcon(
                  icon: FontAwesomeIcons.google,
                  buttonLabel: "Entrar com google",
                  buttonColor: Colors.blue,
                  handlePress: () {
                    print("Entrar com Google");
                  }),
            ],
          )
        ],
      ),
    );
  }
}
