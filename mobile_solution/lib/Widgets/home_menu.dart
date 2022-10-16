import 'package:flutter/material.dart';
import 'package:mobile_solution/Pages/registeration.dart';

import '../models/user.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({Key? key}) : super(key: key);

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

const _style = TextStyle(
  fontSize: 24,
  color: Colors.black,
  fontWeight: FontWeight.w500,
);

class _HomeMenuState extends State<HomeMenu> {
  late User _user;
  @override
  void initState() {
    super.initState();
    _user = User('1', 'timur', 'gay', 'gay', 5);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.white,
        child: Container(
          color: const Color.fromARGB(35, 255, 182, 53),
          child: ListView(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 182, 53)),
                child: Text("Привет 👋🏽 ${_user.name}", style: _style),
              ),
              const Divider(
                height: 8,
                thickness: 1,
                color: Colors.black,
              ),
              ListTile(
                leading: const Icon(
                  Icons.account_box,
                  color: Color.fromARGB(255, 255, 182, 53),
                ),
                title: const Text('Выход', style: _style),
                onTap: () {
                  setState(() async {
                    _user = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()));
                  });
                },
              ),
            ],
          ),
        ));
  }
}
