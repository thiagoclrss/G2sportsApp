import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:g2sports/components/button_with_icon.dart';
import 'package:g2sports/components/button_with_text.dart';
import 'package:g2sports/components/login_form.dart';
import 'package:g2sports/components/text_field_with_icon.dart';

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
      body: SingleChildScrollView(
        child: Column(
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
                  label: "Entrar com facebook",
                  btnColor: Colors.blue.shade700,
                  handlePress: () {
                    print("Entrar com facebook");
                  },
                  width: 313,
                  height: 50,
                ),
                SizedBox(height: 20),
                ButtonWithIcon(
                  icon: FontAwesomeIcons.google,
                  label: "Entrar com google",
                  btnColor: Colors.blue,
                  handlePress: () {
                    print("Entrar com Google");
                  },
                  width: 313,
                  height: 50,
                ),
                SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: Text("OU"),
                      ),
                      Expanded(
                          child: Divider(
                        thickness: 2,
                      )),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                LoginForm(),
                SizedBox(height: 25),
                ButtonWithText(
                  label: "Criar conta",
                  btnColor: Colors.white,
                  txtColor: Colors.grey,
                  txtSize: 28,
                  width: 313,
                  height: 60,
                  handlePress: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
