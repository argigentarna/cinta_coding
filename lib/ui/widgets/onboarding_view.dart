// ignore_for_file: unused_local_variable

import 'package:cinta_coding/shared/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart' as lt;
import 'package:provider/provider.dart';

import '../../providers/login_provider.dart';
import '../../shared/themes.dart';
import 'custom_button.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            title(),
            lt.Lottie.asset(
              lotDeveloper,
              height: 250,
              width: 250,
            ),
            const SizedBox(
              height: 15,
            ),
            buttonLogin(context),
          ],
        ),
      ),
    );
  }

  Widget title() {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: Text(
        'Cinta Coding',
        style: mainTextStyle.copyWith(
          color: kBlackColor,
          fontWeight: extraBold,
          fontSize: defaultFontSize,
        ),
      ),
    );
  }

  Widget buttonLogin(context) {
    return CustomButton(
      title: 'Login',
      onPress: () {
        LoginProvider prov = Provider.of<LoginProvider>(context, listen: false);
        prov.currentIndex = 1;
      },
      margin: EdgeInsets.symmetric(
        horizontal: defaultMargin,
      ),
    );
  }
}
