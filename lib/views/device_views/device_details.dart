import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:homanager_app/services/firebase_services.dart'; 

class DeviceDetailsScreen extends StatefulWidget {
  final String deviceId;

  DeviceDetailsScreen({required this.deviceId});

  @override
  _DeviceDetailsScreenState createState() => _DeviceDetailsScreenState();
}

class _DeviceDetailsScreenState extends State<DeviceDetailsScreen> {
  late Map<String, dynamic> _deviceDetails;
  late DatabaseReference _ledRef;
  double _intensity = 0.0;

  @override
  void initState() {
    super.initState();
    // Obtener los detalles del dispositivo desde Firestore
    _fetchDeviceDetails();

    // Referencia al nodo del LED en la base de datos en tiempo real
    _ledRef = FirebaseDatabase.instance.reference().child('LED').child(widget.deviceId);
  }

  Future<void> _fetchDeviceDetails() async {
    try {
      // Usa la función getDeviceDetails para obtener los detalles del dispositivo
      Map<String, dynamic> deviceDetails = await getDeviceDetails(widget.deviceId);
      setState(() {
        _deviceDetails = deviceDetails;
      });
    } catch (e) {
      // Manejar errores al obtener los detalles del dispositivo
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Dispositivo'),
      ),
      body: _deviceDetails != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nombre: ${_deviceDetails['name']}'),
                      Text('Tipo: ${_deviceDetails['type']}'),
                      Text('Habitación: ${_deviceDetails['room']}'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Intensidad del LED: $_intensity'),
                ),
                Slider(
                  value: _intensity,
                  min: 0,
                  max: 100,
                  divisions: 100,
                  onChanged: _changeIntensity,
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  // Método para cambiar la intensidad del LED en la base de datos en tiempo real
  void _changeIntensity(double newIntensity) {
    _ledRef.set(newIntensity);
    setState(() {
      _intensity = newIntensity;
    });
  }
}
