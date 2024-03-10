import 'package:flutter/material.dart';

class LedView extends StatefulWidget {
  const LedView({Key? key}) : super(key: key);

  @override
  State<LedView> createState() => _LedViewState();
}

class _LedViewState extends State<LedView> {
  bool valueSwitch = false;
  double sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles del Dispositivo"),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Switch_t(),
          Intencidad(),
        ],
      ) 
    );
  }

  Row Switch_t(){
    return Row(
      children: [
        Text(
          'Estado:'
          ),
        Switch(
          value: valueSwitch, 
          onChanged: (value){
            setState(() {
              valueSwitch = value;
            });
          })
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
