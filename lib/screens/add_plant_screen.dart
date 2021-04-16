import 'package:flutter/material.dart';
import 'package:flutter_plant_app/constants.dart';
import 'package:flutter_plant_app/widgets/appbar.dart';

class AddPlantScreen extends StatelessWidget {
  const AddPlantScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
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
                leading: Icon(Icons.location_on_outlined),
                title: new TextField(
                  decoration: InputDecoration(
                      hintText: 'Ubicación',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              new ListTile(
                leading: Icon(Icons.alarm),
                title: new TextField(
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                      suffixText: 'Dias',
                      hintText: 'Frecuencia de regado',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              new ElevatedButton(onPressed: () {}, child: Text('Añadir Foto'))
            ],
          ),
        ),
      ),
    );
  }
}
