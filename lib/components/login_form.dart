import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  final _formKey = GlobalKey<FormState>();

  void handleSubmit() {
    String email = emailController.text.toString();
    String password = passwordController.text.toString();
    Object formData = {email, password};
    if (_formKey.currentState!.validate()) {
      print(formData);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Realizando login...'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erro ao realizar login'),
          backgroundColor: Colors.red,
        ),
      );
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
            label: "Entrar",
            btnColor: Color(0xFF593CFF),
            txtColor: Colors.white,
            txtSize: 40,
            width: 313,
            height: 60,
            handlePress: handleSubmit,
          ),
        ],
      ),
    );
  }
}

String? validatePassword(String? value) {
  RegExp regex = RegExp(r'^.{6,}$');
  if (value.toString().isEmpty) {
    return 'Digite uma senha';
  } else {
    if (!regex.hasMatch(value.toString())) {
      return 'Digite uma senha de no mínimo 6 caracteres';
    } else {
      return null;
    }
  }
}
