import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:g2sports/components/button_with_text.dart';
import 'package:g2sports/components/register_form.dart';

import 'package:g2sports/pages/login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                Text(
                  "Realizar Cadastro",
                  style: TextStyle(
                    fontSize: 35,
                  ),
                ),
                SizedBox(height: 25),
                RegisterForm(),
                SizedBox(height: 25),
                ButtonWithText(
                  label: "Já possuo uma conta",
                  btnColor: Colors.grey.shade100,
                  txtColor: Colors.black38,
                  txtSize: 28,
                  width: 313,
                  height: 60,
                  handlePress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
