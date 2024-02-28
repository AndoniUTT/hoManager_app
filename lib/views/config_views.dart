import 'package:flutter/material.dart';

class ConfigViews extends StatefulWidget {
  const ConfigViews({super.key});

  @override
  State<ConfigViews> createState() => _ConfigViewsState();
}

class _ConfigViewsState extends State<ConfigViews> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("CONFIGURATION"),
        ],
      ),
    );
  }
}