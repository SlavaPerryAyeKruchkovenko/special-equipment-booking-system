import 'package:flutter/material.dart';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.white,
        child: Container(
          color: const Color.fromARGB(35, 255, 182, 53),
          child: ListView(
            children: [
              const DrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 255, 182, 53)),
                child: Text("Привет 👋🏽 Тимур", style: _style),
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
                  setState(() async {});
                },
              ),
            ],
          ),
        ));
  }
}
