import 'package:flutter/material.dart';
import 'package:homanager_app/services/firebase_services.dart';

class Prueba extends StatefulWidget {
  const Prueba({super.key});

  @override
  State<Prueba> createState() => _PruebaState();
}

class _PruebaState extends State<Prueba> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getDevices(),
        builder: ((context, snapshot){
          if (snapshot.hasData){
            return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(snapshot.data?[index]['name']);
            },
          );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        })
        ),
    );
  }
}