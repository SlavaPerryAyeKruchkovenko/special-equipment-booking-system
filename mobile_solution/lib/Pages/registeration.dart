import 'package:flutter/material.dart';

import '../Widgets/page_app_bar.dart';
import '../dependecy_injection.dart';
import '../repository/user_repository.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final UserRepository _repository;
  String _login = "";
  bool _isVisible = false;
  String _password = "";

  @override
  void initState() {
    _repository = Injector.userRepository;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PageAppBar(),
        body: Container(
          margin: const EdgeInsets.all(16),
          child: Form(
              key: _formKey,
              child: Column(children: [
                Center(
                    child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: _buildLogin)),
                Center(
                    child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: _buildPassword)),
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 255, 181, 53))),
                  child: const Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Text(
                      "Confirm",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                )
              ])),
        ));
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    _repository.fetchToken(_login, _password).then((token) => {
          if (token != null)
            {
              _repository.fetchUser(token).then((user) => {
                    if (user != null) {Navigator.pop(context, user)}
                  })
            }
        });
  }

  Widget get _buildLogin {
    return TextFormField(
      maxLength: 128,
      decoration: const InputDecoration(
          labelText: "Login", suffixIcon: Icon(Icons.login)),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Login is Required";
        } else if (value.split(" ").length > 1) {
          return "Login can't contain multiple words";
        }
        return null;
      },
      onSaved: (value) => {
        setState(() {
          if (value != null) {
            _login = value;
          }
        })
      },
    );
  }

  Widget get _buildPassword {
    return TextFormField(
      maxLength: 128,
      obscureText: !_isVisible,
      decoration: InputDecoration(
        labelText: "Password",
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _isVisible = !_isVisible;
              });
            },
            icon: const Icon(Icons.lock)),
        hintText: 'Enter your password',
      ),
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Password is Required";
        }
        return null;
      },
      onSaved: (value) => {
        if (value != null) {_password = value}
      },
    );
  }
}
