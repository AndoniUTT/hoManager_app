import 'package:flutter/material.dart';
import 'package:homanager_app/models/data.dart';

class LoadView extends StatefulWidget {
  final Data datos;
  const LoadView({super.key, required this.datos});

  @override
  State<LoadView> createState() => _LoadViewState();
}

class _LoadViewState extends State<LoadView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.all(15),
          elevation: 20,
          child: const Column(
            children: [
              Text('Nombre: '),
              SizedBox(height: 10,
              ),
              Text('Tipo: '),
              SizedBox(height: 10,
              ),
              Text('Habitacion: '),
              SizedBox(height: 10,
              ),
            ],
          ) 
        ),
    );
  }
}

