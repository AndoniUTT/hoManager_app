import 'package:flutter/material.dart';
import 'package:homanager_app/theme/app_theme.dart';
import 'package:homanager_app/views/led_view.dart';
import 'package:homanager_app/views/registerD_views.dart';

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
                MaterialPageRoute(builder: (context) => RegisterView()
                ),
              );
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.all(15),
          elevation: 10,
          child: ListTile(
            title: Text('Dispositivo: '),
            subtitle: Text('Estado: '),
            leading: Icon(Icons.circle),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => LedView()
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
