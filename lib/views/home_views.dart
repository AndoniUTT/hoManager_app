import 'package:flutter/material.dart';
import 'package:homanager_app/views/device_views/registerD_views.dart';
import 'package:homanager_app/services/firebase_services.dart'; 

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
                value: device['status'] ?? false,
                onChanged: (newValue) async {
                  await updateDeviceStatus(device['id'], newValue);
                  setState(() {
                    devices[index]['status'] = newValue;
                  });
                },
              );
            },
          );
        }
      },
    );
  }
}

class SwitchCard extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool>? onChanged;

  SwitchCard({
    required this.title,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(15),
      elevation: 10,
      child: ListTile(
        title: Text(title),
        subtitle: Text('Estado: ${value ? 'Encendido' : 'Apagado'}'),
        leading: Icon(Icons.circle),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
