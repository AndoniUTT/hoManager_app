import 'package:flutter/material.dart';

class ProfileViews extends StatefulWidget {
  const ProfileViews({super.key});

  @override
  State<ProfileViews> createState() => _ProfileViewsState();
}

class _ProfileViewsState extends State<ProfileViews> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const SizedBox(
              height: 120,
              width: 120,
              child: Image(
                image: AssetImage('assets/img/usuario.png')),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text("Andoni"),
          ),
        ],
      ),
    );
  }

  Widget imageWeb(){
      return SizedBox(
          height: 50,
          width: 50,
          child: Image.network('https://www.pexels.com/es-es/foto/ilustracion-de-bola-de-plasma-414860/'),
        );
  }
}