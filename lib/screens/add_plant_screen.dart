import 'package:flutter/material.dart';
import 'package:flutter_plant_app/constants.dart';
import 'package:flutter_plant_app/widgets/appbar.dart';
import 'package:flutter_plant_app/models/plant.dart';

class AddPlantScreen extends StatefulWidget {
  const AddPlantScreen({Key key}) : super(key: key);

  @override
  _AddPlantScreenState createState() => _AddPlantScreenState();
}

class _AddPlantScreenState extends State<AddPlantScreen> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController ubicacionController = new TextEditingController();
  TextEditingController diasController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_forward),
          onPressed: () {
            _save(nameController.text, ubicacionController.text,
                diasController.text);
          },
        ),
        appBar: BuildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              new ListTile(
                leading: Icon(Icons.nature_people_outlined),
                title: new TextField(
                  controller: nameController,
                  decoration: new InputDecoration(
                      hintText: 'Nombre de la planta',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              new ListTile(
                leading: Icon(Icons.location_on_outlined),
                title: new TextField(
                  controller: ubicacionController,
                  decoration: InputDecoration(
                      hintText: 'Ubicación',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              new ListTile(
                leading: Icon(Icons.alarm),
                title: new TextField(
                  controller: diasController,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                      suffixText: 'Dias',
                      hintText: 'Frecuencia de regado',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              new ElevatedButton(
                onPressed: _read,
                child: Text('Añadir Foto'),
              ),
              new ElevatedButton(
                onPressed: _readAll,
                child: Text('Get All Plants'),
              ),
              new ElevatedButton(
                onPressed: _deleteAll,
                child: Text('Delete All Plants'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_save(String nombre, String ubicacion, String dias) async {
  Plant plant = Plant();
  plant.nombre = nombre;
  plant.diasRegado = int.parse(dias);
  plant.ubicacion = ubicacion;
  DatabaseHelper helper = DatabaseHelper.instance;
  int id = await helper.insert(plant);
  print('Inserted row: $id');
}

_read() async {
  DatabaseHelper helper = DatabaseHelper.instance;
  int rowId = 1;
  Plant plant = await helper.queryPlant(rowId);
  if (plant == null) {
    print('read row $rowId: empty');
  } else {
    print(
        'read row $rowId: ${plant.nombre} ${plant.ubicacion} ${plant.diasRegado}');
  }
}

_readAll() async {
  DatabaseHelper helper = DatabaseHelper.instance;
  List<Plant> plants = await helper.queryAllPlants();
  if (plants == null) {
    print('No plants');
  } else {
    print(plants);
  }
}

_deleteAll() async {
  DatabaseHelper helper = DatabaseHelper.instance;
  int delete = await helper.deleteAllPlants();
  print(delete);
}
