import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key});

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
          onPressed: () {
            // Lógica de registro del dispositivo
            String name = _nameController.text;

            // Puedes imprimir los valores para verificar
            print('Nombre o Alias: $name');
            print('Tipo: $_selectedType');
            print('Habitación: $_selectedRoom');

            // Limpiar los campos
            _nameController.clear();

          },
          child: Text('Registrar Dispositivo'),
        ),

      ],
    );
  }
}