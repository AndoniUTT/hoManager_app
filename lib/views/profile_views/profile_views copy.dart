import 'package:flutter/material.dart';

class ProfileViews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProfileCard(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/img/usuario.png'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Andoni",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ProfileCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileField(label: "Nombre", value: "Andoni"),
                  ProfileField(label: "Correo electrónico", value: "andoni@example.com"),
                  ProfileField(label: "Teléfono", value: "+1234567890"),
                  ProfileField(label: "Ubicación", value: "Ciudad, País"),
                  // Agrega más campos según sea necesario
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final Widget child;

  const ProfileCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 66, 66, 66), // Color de la tarjeta para generar contraste
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}

class ProfileField extends StatelessWidget {
  final String label;
  final String value;

  const ProfileField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$label: ",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
