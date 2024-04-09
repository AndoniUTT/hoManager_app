import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:homanager_app/views/device_views/registerD_views.dart';
import 'package:homanager_app/services/firebase_services.dart'; 

class HomeViews extends StatefulWidget {
  const HomeViews({Key? key});

  @override
  State<HomeViews> createState() => _HomeViewsState();
}

class _HomeViewsState extends State<HomeViews> {
  final DatabaseReference _ledsRef = FirebaseDatabase.instance.reference().child('LED'); // Referencia a los nodos de los LEDs

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
            MaterialPageRoute(builder: (context) => RegisterView()),
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
              return SwitchCard(
                title: device['name'] ?? 'Dispositivo ${index + 1}',
                // Instancia del nodo del LED correspondiente en la base de datos en tiempo real
                ledRef: _ledsRef.child('digital${index + 1}'), // Cambiar 'digital${index + 1}' según la estructura de tu base de datos
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
  final DatabaseReference ledRef; // Instancia del nodo del LED en la base de datos en tiempo real

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
    // Obtener el valor inicial del interruptor desde la base de datos en tiempo real
    widget.ledRef.onValue.listen((event) {
      setState(() {
        _value = (event.snapshot.value ?? false) as bool; // Conversión explícita a bool
      });
    });
  }

  // Método para cambiar el estado del LED en la base de datos en tiempo real
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
          onChanged: _toggleLed, // Llama al método para cambiar el estado del LED
        ),
      ),
    );
  }
}
