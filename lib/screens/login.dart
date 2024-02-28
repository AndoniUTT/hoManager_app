import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/logo.jpeg',
          width: 200,
          height: 200,
        ),
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(labelText: 'Inicia sesión con tu correo o numero telefonico'),
        ),
        SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            
          },
          child: Text('Iniciar sesión'),
        ),
      ],
    );
  }
}
