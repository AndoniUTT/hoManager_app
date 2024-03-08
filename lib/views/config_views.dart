import 'package:flutter/material.dart';

class ConfigViews extends StatefulWidget {
  const ConfigViews({super.key});

  @override
  State<ConfigViews> createState() => _ConfigViewsState();
}

class _ConfigViewsState extends State<ConfigViews> {
  bool Check1 = false;
  bool Check2 = false;
  bool Check3 = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          entradasCheck(),
        ],
      ),
    );
  }

  Column settings(){
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ListTile(
          title: Text('Configurar app'),
        )
      ],
    );
  }

  Row entradasCheck() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Aprueba',
        ),
        Checkbox(
            value: Check1,
            onChanged: (value) {
              setState(() {
                Check1 = value!;
              });
            }),
        Text(
          'Aprueba 2',
        ),
        Checkbox(
            value: Check2,
            onChanged: (value) {
              setState(() {
                Check2 = value!;
            });
        }),
        Text(
          'Aprueba 3',
        ),
        Checkbox(
            value: Check3,
            onChanged: (value) {
              setState(() {
                Check3 = value!;
            });
        }),
      ],
    );
  }
}