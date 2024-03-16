import 'package:flutter/material.dart';

class LedView extends StatefulWidget {
  const LedView({Key? key}) : super(key: key);

  @override
  State<LedView> createState() => _LedViewState();
}

class _LedViewState extends State<LedView> {
final TextEditingController _nameController = TextEditingController();

  bool valueSwitch = false;
  double sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles del Dispositivo"),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.all(15),
            elevation: 10,
            child: const SizedBox(
              height: 150,
              width: 120,
              child: Text('Icono o imagen'),
            ),
          ),
        const SizedBox(height: 16.0),
          DeviceForm(),
        ],
      ) 
    );
  }

  Column DeviceForm(){
    return Column(
      children: [
        TextField(
          controller: _nameController,
          decoration: InputDecoration(labelText: 'Nombre Alias'),
        ),
        Divider(),
        TextField(
          controller: _nameController,
          decoration: InputDecoration(labelText: 'Tipo de dispositivo'),
        ),
        Divider(),
        TextField(
          controller: _nameController,
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
              onPressed: () => Navigator.pop(context),
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

  Column Intencidad() {
    return Column(
      children: [
        Slider(
          min: 0.0,
          max: 10.0,
          value: sliderValue,
          divisions: 10,
          label: '${sliderValue.round()}',
          onChanged: (value) {
            setState(() {
              sliderValue = value;
              // print('Valor del slider: $sliderValue');
            });
          },
        ),
      ],
    );
  }
}
