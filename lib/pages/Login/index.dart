import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:g2sports/components/button_with_icon.dart';
import 'package:g2sports/components/button_with_text.dart';
import 'package:g2sports/pages/Login/login_form.dart';

import 'package:g2sports/pages/Register/index.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    void handleGoogleSignIn() async {
      setState(() {
        isLoading = true;
      });
      context.loaderOverlay.show();
      UserCredential userCredential = await signInWithGoogle();
      setState(() {
        isLoading = false;
      });
      context.loaderOverlay.hide();
      print(userCredential);
    }

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
                  handlePress: handleGoogleSignIn,
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
                  isDisabled: false,
                  label: "Quero criar uma conta",
                  btnColor: Colors.grey.shade100,
                  txtColor: Colors.black38,
                  txtSize: 18,
                  width: 313,
                  height: 60,
                  handlePress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Register(),
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

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
