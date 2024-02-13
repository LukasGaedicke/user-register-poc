import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:user_registration/resources/strings.dart';

import '../../domain/model/user_credential_model.dart';
import '../bloc/login/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _passwordVisible = true;
  String _errorMessage = '';

  void _validateEmail(String value) {
    setState(() {
      if (value.isEmpty) {
        _errorMessage = 'O campo de e-mail não pode ser vazio.';
      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
        _errorMessage = 'Informe um e-mail válido.';
      } else {
        _errorMessage = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginBloc = Provider.of<LoginBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.loginPage),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                  labelText: Strings.email,
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 24.0)),
              style: const TextStyle(fontSize: 16),
              onChanged: _validateEmail,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: !_passwordVisible,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                labelText: Strings.password,
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 32.0),
            BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  Navigator.of(context)
                      .pushReplacementNamed('/home', arguments: state.uid);
                }
              },
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is LoginFailure) {
                    _errorMessage = state.message.toString();
                  }
                  return Text(
                    _errorMessage,
                    style: const TextStyle(color: Colors.red),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
              child: ElevatedButton(
                onPressed: () {
                  final userCredentialModel = UserCredentialModel(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                  loginBloc.add(TryLogin(userCredentialModel));
                },
                child: const Text(
                  Strings.login,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/signup');
                },
                child: const Text(
                  Strings.signUp,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
