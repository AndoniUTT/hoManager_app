import 'package:flutter/material.dart';
import 'package:homanager_app/views/device_views/registerD_views.dart';

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
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => RegisterView()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  ListView _buildListView(BuildContext context){
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (_, index) {
        return SwitchCard(
          title: 'Dispositivo ${index + 1}',
          value: false, // Aquí deberías tener una variable que controle el estado del interruptor
          onChanged: (newValue) {
            // Aquí deberías actualizar el estado del interruptor
            // probablemente usando setState en un StatefulWidget
            print('Nuevo valor del interruptor: $newValue');
          },
        );
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
        subtitle: Text('Estado: '),
        leading: Icon(Icons.circle),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
