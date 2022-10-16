import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../Widgets/home_menu.dart';
import '../Widgets/page_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PageAppBar(),
      body: _body,
      drawer: const HomeMenu(),
      extendBody: true,
    );
  }

  Widget get _body {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.all(8),
      child: const YandexMap(),
    ));
  }
}
