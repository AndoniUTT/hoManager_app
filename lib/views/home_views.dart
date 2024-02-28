import 'package:flutter/material.dart';

class HomeViews extends StatefulWidget {
  const HomeViews({Key? key});

  @override
  State<HomeViews> createState() => _HomeViewsState();
}

class _HomeViewsState extends State<HomeViews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // DISPOSITIVOS
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //  ---  AGREGAR DISPOSITIVO
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
