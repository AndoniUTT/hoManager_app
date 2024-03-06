import 'package:flutter/material.dart';
import 'package:homanager_app/screens/main_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
        const SizedBox(
          child: Image(
          image: AssetImage('assets/img/logo.jpeg'),
          ),
          height: 350,
          width: 350,
        ),
        
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(labelText: 'Inicia sesión con tu correo o numero telefonico'),
        ),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => MainScreen()
                ),
                );
          },
          child: Text('Iniciar sesión'),
        ),
      ],
    );
  }
}