import 'package:flutter/material.dart';
import 'package:mobile_solution/Pages/registeration.dart';

import 'dependecy_injection.dart';

void main() {
  Injector.configure(Flavor.mock);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const Map<int, Color> color = {
      50: Color.fromRGBO(255, 182, 53, .1),
      100: Color.fromRGBO(255, 182, 53, .2),
      200: Color.fromRGBO(255, 182, 53, .3),
      300: Color.fromRGBO(255, 182, 53, .4),
      400: Color.fromRGBO(255, 182, 53, .5),
      500: Color.fromRGBO(255, 182, 53, .6),
      600: Color.fromRGBO(255, 182, 53, .7),
      700: Color.fromRGBO(255, 182, 53, .8),
      800: Color.fromRGBO(255, 182, 53, .9),
      900: Color.fromRGBO(255, 182, 53, 1),
    };
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: const MaterialColor(0xFFFFB635, color),
        primaryColor: const Color.fromARGB(255, 255, 182, 53),
      ),
      home: const RegisterPage(),
    );
  }
}
