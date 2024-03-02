import 'package:flutter/material.dart';

class DeviceView extends StatelessWidget {
  const DeviceView(int index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Dispositivo'),
      ),
      body: Center(
        child: Text('Dispositivo: '),
      ),
    );
  }
}