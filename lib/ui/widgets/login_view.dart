// ignore_for_file: unused_local_variable, avoid_print

import 'package:cinta_coding/shared/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../providers/login_provider.dart';
import 'custom_button.dart';
import 'custom_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController username = TextEditingController(text: '');
  TextEditingController password = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          title(),
          usernameField(),
          passwordField(),
          const SizedBox(
            height: 30,
          ),
          buttonLogin(context),
        ],
      ),
    );
  }

  Widget title() {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: Text(
        'Login Page',
        style: mainTextStyle.copyWith(
          color: kBlackColor,
          fontWeight: extraBold,
          fontSize: defaultFontSize,
        ),
      ),
    );
  }

  Widget usernameField() {
    return CustomTextfield(
      textField: username,
      margin: EdgeInsets.symmetric(
        horizontal: defaultMargin,
        vertical: 10,
      ),
      hintText: 'username',
      hintStyle: TextStyle(
        color: kCloudyGrayColor,
        fontSize: 18,
      ),
    );
  }

  Widget passwordField() {
    return CustomTextfield(
      textField: password,
      margin: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 10,
      ),
      hintText: 'password',
      hintStyle: TextStyle(
        color: kCloudyGrayColor,
        fontSize: 18,
      ),
    );
  }

  Widget buttonLogin(context) {
    return CustomButton(
      title: 'Login',
      onPress: () {
        LoginProvider prov = Provider.of<LoginProvider>(context, listen: false);
        prov.login(
          context,
          username.text,
          password.text,
        );
      },
      margin: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
    );
  }
}
