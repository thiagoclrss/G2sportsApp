import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:validadores/Validador.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:g2sports/components/button_with_text.dart';
import 'package:g2sports/components/text_field_with_icon.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final cpfMask = MaskTextInputFormatter(
      mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});

  final _formKey = GlobalKey<FormState>();

  void handleSubmit() {
    String email = emailController.text.toString();
    String password = passwordController.text.toString();
    String cpf = cpfController.text.toString();
    Object formData = {email, password, cpf};
    if (_formKey.currentState!.validate()) {
      print(formData);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Realizando cadastro...'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erro ao realizar cadastro'),
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
            hintText: "email@email.com",
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
          ),
          SizedBox(height: 20),
          TextFieldWithIcon(
            hintText: '123.456.789-00',
            inputFormatters: [cpfMask],
            isObscure: false,
            keyboardType: TextInputType.visiblePassword,
            controller: cpfController,
            prefixIcon: FontAwesomeIcons.idCard,
            labelText: "CPF",
            width: 313,
            validator: (value) {
              return Validador()
                  .add(Validar.CPF, msg: 'CPF inválido')
                  .add(Validar.OBRIGATORIO, msg: 'Campo obrigatório')
                  .minLength(11)
                  .maxLength(11)
                  .valido(value, clearNoNumber: true);
            },
          ),
          SizedBox(height: 20),
          TextFieldWithIcon(
            hintText: "*******",
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
            // validator: validatePassword,
          ),
          SizedBox(height: 50),
          ButtonWithText(
            label: "Cadastrar",
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
