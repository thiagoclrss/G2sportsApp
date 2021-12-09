import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:g2sports/pages/home_page.dart';
import 'package:validadores/Validador.dart';

import 'package:g2sports/components/button_with_text.dart';
import 'package:g2sports/components/text_field_with_icon.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  void handleSubmit() async {
    String email = emailController.text.toString();
    String password = passwordController.text.toString();

    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login realizado com sucesso'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
        setState(() {
          isLoading = false;
        });
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case 'user-not-found':
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Nenhum usuário encontrado para esse e-mail.'),
                backgroundColor: Colors.red,
              ),
            );
            setState(() {
              isLoading = false;
            });
            break;
          case 'wrong-password':
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Senha errada fornecida para esse usuário.'),
                backgroundColor: Colors.red,
              ),
            );
            setState(() {
              isLoading = false;
            });
            break;
          default:
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Erro ao realizar login.'),
                backgroundColor: Colors.red,
              ),
            );
            setState(() {
              isLoading = false;
            });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: _formKey,
      child: Column(
        children: [
          TextFieldWithIcon(
            isObscure: false,
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            prefixIcon: FontAwesomeIcons.userAlt,
            labelText: "E-mail",
            width: 313,
            validator: (value) {
              return Validador()
                  .add(Validar.EMAIL, msg: 'E-mail inválido')
                  .add(Validar.OBRIGATORIO, msg: 'Campo obrigatório')
                  .valido(value);
            },
            hintText: "email@email.com",
          ),
          SizedBox(height: 20),
          TextFieldWithIcon(
            isObscure: true,
            keyboardType: TextInputType.visiblePassword,
            controller: passwordController,
            prefixIcon: FontAwesomeIcons.key,
            labelText: "Senha",
            width: 313,
            validator: (value) {
              return Validador()
                  .add(Validar.OBRIGATORIO, msg: 'Campo obrigatório')
                  .minLength(6,
                      msg: 'A senha precisa ter no mínimo 6 caracteres')
                  .valido(value, clearNoNumber: true);
            },
            hintText: "*****",
          ),
          SizedBox(height: 50),
          ButtonWithText(
            isDisabled: isLoading,
            label: "Entrar",
            btnColor: Color(0xFF593CFF),
            txtColor: Colors.white,
            txtSize: 36,
            width: 313,
            height: 60,
            handlePress: handleSubmit,
          ),
        ],
      ),
    );
  }
}
