import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../Widgets/home_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _body,
      drawer: const HomeMenu(),
      extendBody: true,
    );
  }

  PreferredSizeWidget get _appBar {
    return AppBar(
        title: Align(
      alignment: Alignment.centerLeft,
      child: Image.asset(
        '${(kDebugMode && kIsWeb) ? "" : "assets/"}images/logo.png',
        width: 180,
      ),
    ));
  }

  Widget get _body {
    return const Center();
  }
}
