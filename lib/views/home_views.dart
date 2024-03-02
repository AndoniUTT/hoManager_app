import 'package:flutter/material.dart';
import 'package:homanager_app/views/device_views.dart';

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
        title: Text("Home"),
      ),
      body: _buildListView(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //  ---  AGREGAR DISPOSITIVO
        },
        child: Icon(Icons.add),
      ),
    );
  }

  ListView _buildListView(BuildContext context){
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (_,index) {
        return Card(
          child: ListTile(
          title: Text('Dispositivo: '),
          subtitle: Text('Estado: '),
          leading: Icon(Icons.circle),
          trailing: IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => DeviceView(index)
                ),
              );
            },
          ),
        ),
      );
      },
    );
  }
}
