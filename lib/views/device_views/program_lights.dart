import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AutomationScreen extends StatefulWidget {
  @override
  _AutomationScreenState createState() => _AutomationScreenState();
}

class _AutomationScreenState extends State<AutomationScreen> {
  DateTime _turnOnTime = DateTime.now(); 
  DateTime _turnOffTime = DateTime.now(); 
  List<bool> _selectedDays = List.generate(7, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Automatización de luces'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hora de Encendido:',
              style: TextStyle(fontSize: 18.0),
            ),
            ElevatedButton(
              onPressed: () => _selectTime(context, true),
              child: Text(_turnOnTime.toString()),
            ),
            SizedBox(height: 16.0),
            Text(
              'Hora de Apagado:',
              style: TextStyle(fontSize: 18.0),
            ),
            ElevatedButton(
              onPressed: () => _selectTime(context, false),
              child: Text(_turnOffTime.toString()),
            ),
            SizedBox(height: 16.0),
            Text(
              'Días de la Semana:',
              style: TextStyle(fontSize: 18.0),
            ),
            Wrap(
              spacing: 8.0,
              children: List.generate(7, (index) {
                return FilterChip(
                  label: Text(_getDayLabel(index)),
                  selected: _selectedDays[index],
                  onSelected: (selected) {
                    setState(() {
                      _selectedDays[index] = selected;
                    });
                  },
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveAutomationSettings,
        child: Icon(Icons.save),
      ),
    );
  }

  Future<void> _selectTime(BuildContext context, bool isTurnOnTime) async {
    final initialTime = isTurnOnTime ? _turnOnTime : _turnOffTime;
    final selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initialTime),
    );

    if (selectedTime != null) {
      setState(() {
        if (isTurnOnTime) {
          _turnOnTime = DateTime(_turnOnTime.year, _turnOnTime.month, _turnOnTime.day, selectedTime.hour, selectedTime.minute);
        } else {
          _turnOffTime = DateTime(_turnOffTime.year, _turnOffTime.month, _turnOffTime.day, selectedTime.hour, selectedTime.minute);
        }
      });
    }
  }

  String _getDayLabel(int index) {
    switch (index) {
      case 0:
        return 'Lun';
      case 1:
        return 'Mar';
      case 2:
        return 'Mié';
      case 3:
        return 'Jue';
      case 4:
        return 'Vie';
      case 5:
        return 'Sáb';
      case 6:
        return 'Dom';
      default:
        return '';
    }
  }

  void _saveAutomationSettings() async {
    try {
      final automationData = {
        'turnOnTime': Timestamp.fromDate(_turnOnTime),
        'turnOffTime': Timestamp.fromDate(_turnOffTime),
        'selectedDays': _selectedDays,
      };

      await FirebaseFirestore.instance.collection('automationSettings').doc('default').set(automationData);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Configuración de automatización guardada exitosamente.'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al guardar la configuración de automatización: $e'),
        ),
      );
    }
  }
}
