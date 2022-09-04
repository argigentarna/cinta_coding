// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unnecessary_const, unnecessary_new

import 'package:cinta_coding/shared/helper.dart';
import 'package:cinta_coding/shared/themes.dart';
import 'package:cinta_coding/ui/widgets/custom_button.dart';
import 'package:cinta_coding/ui/widgets/custom_textfield.dart';
import 'package:cinta_coding/ui/widgets/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/login_provider.dart';
import '../../shared/const.dart';
import '../widgets/login_view.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoginProvider provLogin = Provider.of<LoginProvider>(
      context,
      listen: false,
    );
    provLogin.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LoginProvider>(
        builder: (_, prov, ch) {
          if (prov.currentIndex == 0) {
            return OnboardingView();
          }
          return LoginView();
        },
      ),
    );
  }
}
