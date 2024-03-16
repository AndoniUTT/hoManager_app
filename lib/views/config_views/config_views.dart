import 'package:flutter/material.dart';

class ConfigViews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configuración"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ConfigOption(title: "Cambiar contraseña"),
          ConfigOption(title: "Notificaciones"),
          ConfigOption(title: "Preferencias de idioma"),
          ConfigOption(title: "Tema de la aplicación"),
          ConfigOption(title: "Configuración de cuenta"),
        ],
      ),
    );
  }
}

class ConfigOption extends StatelessWidget {
  final String title;

  const ConfigOption({required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Acción a realizar al seleccionar esta opción
        print("Seleccionaste: $title");
      },
    );
  }
}
