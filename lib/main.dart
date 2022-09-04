import 'package:cinta_coding/providers/home_provider.dart';
import 'package:cinta_coding/shared/themes.dart';
import 'package:cinta_coding/ui/pages/detil_posting.dart';
import 'package:cinta_coding/ui/pages/detil_profile.dart';
import 'package:cinta_coding/ui/pages/homepage.dart';
import 'package:cinta_coding/ui/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cinta_coding/providers/login_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: swatchColor,
        ),
        home: const Login(),
        routes: <String, WidgetBuilder>{
          '/home': (context) => const Homepage(),
          '/detil_posting': (context) => DetilPosting(),
          '/detil_profile': (context) => const DetilProfile(),
        },
      ),
    ),
  );
}
