import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:g2sports/components/button_with_icon.dart';
import 'package:g2sports/components/button_with_text.dart';
import 'package:g2sports/pages/Login/login_form.dart';

import 'package:g2sports/pages/Register/index.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    void handleGoogleSignIn() async {
      try {
        context.loaderOverlay.show();
        UserCredential userCredential = await signInWithGoogle();
        context.loaderOverlay.hide();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login realizado com sucesso.'),
            backgroundColor: Colors.green,
          ),
        );
        print(userCredential);
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case 'account-exists-with-different-credential':
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                    'Já existe uma conta com o mesmo endereço de e-mail, mas com credenciais de login diferentes. Faça login usando um provedor associado a este endereço de e-mail.'),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 6),
              ),
            );
            context.loaderOverlay.hide();
            break;
          default:
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Erro ao realizar login pelo google.'),
                backgroundColor: Colors.red,
              ),
            );
            context.loaderOverlay.hide();
        }
      }
    }

    void handleFacebookSignIn() async {
      try {
        context.loaderOverlay.show();
        UserCredential userCredential = await signInWithFacebook();
        context.loaderOverlay.hide();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login realizado com sucesso.'),
            backgroundColor: Colors.green,
          ),
        );
        print(userCredential);
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case 'account-exists-with-different-credential':
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                    'Já existe uma conta com o mesmo endereço de e-mail, mas com credenciais de login diferentes. Faça login usando um provedor associado a este endereço de e-mail.'),
                backgroundColor: Colors.red,
              ),
            );
            context.loaderOverlay.hide();
            break;
          default:
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Erro ao realizar login pelo facebook.'),
                backgroundColor: Colors.red,
              ),
            );
            context.loaderOverlay.hide();
        }
      }
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
                  handlePress: handleFacebookSignIn,
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
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

Future<UserCredential> signInWithFacebook() async {
  final LoginResult loginResult = await FacebookAuth.instance.login();
  final OAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(loginResult.accessToken!.token);
  return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}
