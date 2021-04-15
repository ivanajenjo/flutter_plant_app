import 'package:flutter/material.dart';
import 'package:flutter_plant_app/constants.dart';
import 'package:flutter_plant_app/widgets/appbar.dart';

class PlantScreen extends StatelessWidget {
  const PlantScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: kPrimaryColor,
        ),
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              new ListTile(
                leading: Icon(Icons.nature_people_outlined),
                title: new TextField(
                  decoration: new InputDecoration(
                      hintText: 'Nombre de la planta',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              new ListTile(
                leading: Icon(Icons.alarm),
                title: new TextField(
                  decoration: new InputDecoration(
                      hintText: 'Frecuencia de regado',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              new ListTile(
                leading: Icon(Icons.location_on_outlined),
                title: new TextField(
                  decoration: InputDecoration(
                      hintText: 'Ubicación',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Divider(
                height: 5.0,
              ),
              new ListTile(
                leading: Icon(Icons.label),
                title: Text('Titulo'),
                subtitle: Text('Subtitulo'),
              ),
              new ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text('Cumpleaños'),
                subtitle: Text('Subtitulo'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
