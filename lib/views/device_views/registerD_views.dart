import 'package:flutter/material.dart';
import 'package:homanager_app/services/firebase_services.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nuevo Dispositivo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RegisterDeviceForm(),
      ),
    );
  }
}

class RegisterDeviceForm extends StatefulWidget {
  @override
  _RegisterDeviceFormState createState() => _RegisterDeviceFormState();
}

class _RegisterDeviceFormState extends State<RegisterDeviceForm> {
  final TextEditingController _nameController = TextEditingController();
  String _selectedType = '---';
  String _selectedRoom = '---';

  final List<String> _deviceTypes = [ '---','Bocina', 'Luz', 'TV'];
  final List<String> _rooms = [ '---','Dormitorio', 'Cocina', 'Sala'];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const SizedBox(
              height: 120,
              width: 120,
              child: Image(
                image: AssetImage('assets/img/devices.png')),
            ),
          ),
        TextField(
          controller: _nameController,
          decoration: InputDecoration(labelText: 'Nombre o Alias'),
        ),
        SizedBox(height: 16.0),
        DropdownButtonFormField<String>(
          value: _selectedType,
          items: _deviceTypes.map((type) {
            return DropdownMenuItem<String>(
              value: type,
              child: Text(type),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedType = value!;
            });
          },
          decoration: InputDecoration(labelText: 'Tipo'),
        ),

        SizedBox(height: 16.0),
        DropdownButtonFormField<String>(
          value: _selectedRoom,
          items: _rooms.map((room) {
            return DropdownMenuItem<String>(
              value: room,
              child: Text(room),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedRoom = value!;
            });
          },
          decoration: InputDecoration(labelText: 'Habitación'),
        ),
        SizedBox(height: 16.0),
        
      ElevatedButton(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('¿Desea modificar los datos?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  await addDevice(
                    _nameController.text,
                    _selectedType,
                    _selectedRoom,
                  );
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        ),
        child: Text('Guardar'),
      ),
      ],
    );
  }
}
