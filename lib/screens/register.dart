import 'dart:async';
import 'package:flutter/material.dart';
import 'package:homanager_app/screens/main_screen.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: RegisterForm(),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.grey[200],
            child: Icon(
              Icons.person,
              size: 50,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: 'Nombre de usuario',
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Correo electrónico',
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _phoneController,
            decoration: InputDecoration(
              labelText: 'Número telefónico',
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: _locationController,
            decoration: InputDecoration(
              labelText: 'Localidad',
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _isLoading ? null : _handleRegistration,
            child: _isLoading
                ? CircularProgressIndicator() // Muestra un indicador de carga si isLoading es true
                : Text('Registrarse'),
          ),
        ],
      ),
    );
  }

  void _handleRegistration() {
    // Muestra la alerta con el indicador de carga
    setState(() {
      _isLoading = true;
    });

    // Simula un retraso de 3 segundos antes de navegar a otra pantalla
    Timer(Duration(seconds: 4), () {
      // Oculta la alerta
      setState(() {
        _isLoading = false;
      });

      // Navega a otra pantalla
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    });
  }
}
