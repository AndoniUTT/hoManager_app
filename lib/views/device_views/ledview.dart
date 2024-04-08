import 'package:flutter/material.dart';
import 'package:homanager_app/services/firebase_services.dart';

class DeviceDetailsScreen extends StatelessWidget {
  final String deviceId;
  final String name;
  final String type;
  final String room;
  final bool isOn;

  const DeviceDetailsScreen({
    Key? key,
    required this.deviceId,
    required this.name,
    required this.type,
    required this.room,
    required this.isOn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Dispositivo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nombre: $name',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Tipo: $type',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Habitación: $room',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Estado: ',
                  style: TextStyle(fontSize: 18),
                ),
                Switch(
                  value: isOn,
                  onChanged: (newValue) async {
                    // Actualiza el estado del dispositivo en la base de datos
                    await updateDeviceStatus(deviceId, newValue);
                    // No necesitas actualizar el estado local aquí
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

