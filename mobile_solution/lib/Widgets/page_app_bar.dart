import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PageAppBar extends StatelessWidget implements PreferredSizeWidget {
  PageAppBar({super.key});

  final AppBar appBar = AppBar(
      title: Align(
    alignment: Alignment.centerLeft,
    child: Image.asset(
      '${(kDebugMode && kIsWeb) ? "" : "assets/"}images/logo.png',
      width: 180,
    ),
  ));
  @override
  AppBar build(BuildContext context) {
    return appBar;
  }

  @override
  Size get preferredSize => appBar.preferredSize;
}
