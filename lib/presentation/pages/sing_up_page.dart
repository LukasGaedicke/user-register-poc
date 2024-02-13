import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_registration/domain/entities/user.dart';
import 'package:user_registration/presentation/bloc/sing_up/sing_up_bloc.dart';
import 'package:user_registration/resources/strings.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  String _errorMessage = 'Preencha todos os campos.';
  String? accessLevel;

  void _validateEmpty(String value) {
    setState(() {
      if (value.isEmpty) {
        _errorMessage = Strings.fieldsNotEmpty;
      } else {
        _errorMessage = '';
      }
    });
  }

  void _validateEmail(String value) {
    setState(() {
      if (value.isEmpty) {
        _errorMessage = Strings.emailNotEmpty;
      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
        _errorMessage = Strings.emailValid;
      } else {
        _errorMessage = '';
      }
    });
  }

  void _validatePassword(String value) {
    setState(() {
      if (value.isEmpty) {
        _errorMessage = Strings.passwordNotEmpty;
      } else if (value.length < 6) {
        _errorMessage = Strings.passwordMinLength;
      } else {
        _errorMessage = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.userRegistration),
      ),
      body: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            Navigator.of(context)
                .pushReplacementNamed('/home', arguments: state.uid);
          } else if (state is SignUpFailure) {
            setState(() {
              _errorMessage = state.errorMessage;
            });
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(labelText: Strings.firstName),
                onChanged: _validateEmpty,
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(labelText: Strings.lastName),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: Strings.email),
                controller: _emailController,
                onChanged: _validateEmail,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: Strings.password),
                onChanged: _validatePassword,
              ),
              _dropdownButton(),
              const SizedBox(height: 20),
              if (_errorMessage.isNotEmpty)
                Text(
                  _errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
                child: ElevatedButton(
                  onPressed: () {
                    if (_errorMessage.isNotEmpty) {
                      setState(() {
                        _errorMessage = Strings.reviewAllFields;
                      });
                      return;
                    }

                    final user = UserDomain(
                      firstName: _firstNameController.text,
                      lastName: _lastNameController.text,
                      email: _emailController.text,
                      accessLevel: accessLevel?.toLowerCase() ?? 'user',
                      password: _passwordController.text,
                    );
                    BlocProvider.of<SignUpBloc>(context).add(SignUpEvent(user));
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
      ),
    );
  }

  Widget _dropdownButton() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: DropdownButton<String>(
        value: accessLevel,
        hint: const Text(Strings.accessLevel),
        onChanged: (String? newValue) {
          setState(() {
            accessLevel = newValue;
          });
        },
        items: <String>['admin', 'user']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
