import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:homanager_app/views/device_views/program_lights.dart';
import 'package:homanager_app/services/firebase_services.dart'; // Importa FirebaseServices
import 'package:homanager_app/views/device_views/device_details.dart';

class HomeViews extends StatefulWidget {
  const HomeViews({Key? key});

  @override
  State<HomeViews> createState() => _HomeViewsState();
}

class _HomeViewsState extends State<HomeViews> {
  final DatabaseReference _ledsRef = FirebaseDatabase.instance.reference().child('LED'); // Referencia a los nodos de los LEDs

  @override
  void initState() {
    super.initState();
    _activateAutomation();
  }

  Future<void> _activateAutomation() async {
  try {
    Map<String, dynamic> automationSettings = await getAutomationSettings();
    print('Configuraciones de automatización obtenidas: $automationSettings');

    // Verificar si es hora de apagar las luces
    if (_isTimeToTurnOffLights(automationSettings)) {
      print('Es hora de apagar las luces');
      // Obtener la lista de dispositivos
      List<Map<String, dynamic>> devices = await getDevices();
      print('Dispositivos obtenidos: $devices');

      // Apagar las luces para cada dispositivo
      for (Map<String, dynamic> device in devices) {
        String deviceId = device['id']; // Asegúrate de tener el campo 'id' en tu documento de dispositivo
        print('Apagando dispositivo $deviceId');
        await updateDeviceStatus(deviceId, false); // Apagar el dispositivo
      }

      // Apagar todas las luces en la base de datos en tiempo real
      for (int i = 1; i <= 8; i++) {
        print('Apagando luz digital $i');
        await _ledsRef.child('digital$i').set(false);
      }
    }
  } catch (e) {
    print('Error al activar la automatización: $e');
  }
}

  bool _isTimeToTurnOffLights(Map<String, dynamic> automationSettings) {
  // Obtener la hora actual
  DateTime now = DateTime.now();

  print('Hora actual: $now');

  // Obtener la hora de apagado definida en las configuraciones de automatización
  Timestamp turnOffTimestamp = automationSettings['turnOffTime'];
  DateTime turnOffTime = turnOffTimestamp.toDate();

  print('Hora de apagado definida en configuraciones: $turnOffTime');

  // Obtener los días seleccionados para la automatización
  List<bool> selectedDays = List<bool>.from(automationSettings['selectedDays']);
  
  // Obtener el día de la semana actual (lunes = 1, martes = 2, ..., domingo = 7)
  int currentWeekday = now.weekday;

  print('Día de la semana actual: $currentWeekday');
  print('¿Día de la semana actual seleccionado en configuraciones? ${selectedDays[currentWeekday - 1]}');

  // Verificar si es el día correcto y si es hora de apagar las luces
  if (selectedDays[currentWeekday - 1] &&
      now.hour == turnOffTime.hour &&
      now.minute == turnOffTime.minute) {
    print('Es hora de apagar las luces');
    return true; // Es hora de apagar las luces
  } else {
    print('No es hora de apagar las luces');
    return false; // No es hora de apagar las luces
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicio"),
      ),
      body: _buildListView(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AutomationScreen()),
          );
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<List<Map<String, dynamic>>> _fetchDeviceList() async {
    return getDevices();
  }

  Widget _buildListView(BuildContext context) {
    return FutureBuilder(
      future: _fetchDeviceList(),
      builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error al cargar los dispositivos: ${snapshot.error}'),
          );
        } else {
          final devices = snapshot.data!;
          return ListView.builder(
            itemCount: devices.length,
            itemBuilder: (context, index) {
              final device = devices[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DeviceDetailsScreen(deviceId: 'digital${index + 1}')), 
                  );
                },
                child: SwitchCard(
                  title: device['name'] ?? 'Dispositivo ${index + 1}',
                  ledRef: _ledsRef.child('digital${index + 1}'), 
                ),
              );
            },
          );
        }
      },
    );
  }
}

class SwitchCard extends StatefulWidget {
  final String title;
  final DatabaseReference ledRef; // Instancia del LED en la base de datos en tiempo real

  SwitchCard({
    required this.title,
    required this.ledRef,
  });

  @override
  _SwitchCardState createState() => _SwitchCardState();
}

class _SwitchCardState extends State<SwitchCard> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = false; 
    widget.ledRef.onValue.listen((event) {
      if (mounted) { 
        setState(() {
          _value = (event.snapshot.value ?? false) as bool; 
        });
      }
    });
  }

  void _toggleLed(bool newValue) {
    widget.ledRef.set(newValue);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(15),
      elevation: 10,
      child: ListTile(
        title: Text(widget.title),
        subtitle: Text('Estado: ${_value ? 'Encendido' : 'Apagado'}'),
        leading: Icon(Icons.circle),
        trailing: Switch(
          value: _value,
          onChanged: _toggleLed, 
        ),
      ),
    );
  }
}
