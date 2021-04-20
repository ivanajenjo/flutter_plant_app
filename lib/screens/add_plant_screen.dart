import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_plant_app/constants.dart';
import 'package:flutter_plant_app/utils/database_helper.dart';
import 'package:flutter_plant_app/utils/utility.dart';
import 'package:flutter_plant_app/widgets/appbar.dart';
import 'package:flutter_plant_app/models/plant.dart';
import 'package:image_picker/image_picker.dart';

class AddPlantScreen extends StatefulWidget {
  const AddPlantScreen({Key key}) : super(key: key);

  @override
  _AddPlantScreenState createState() => _AddPlantScreenState();
}

class _AddPlantScreenState extends State<AddPlantScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ubicacionController = TextEditingController();
  TextEditingController diasController = TextEditingController();
  File _image;
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_forward),
          onPressed: () {
            _save(nameController.text, ubicacionController.text,
                diasController.text, _image);
            Navigator.pop(context);
          },
        ),
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.nature_people_outlined),
                title: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      hintText: 'Nombre de la planta',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              ListTile(
                leading: Icon(Icons.location_on_outlined),
                title: TextField(
                  controller: ubicacionController,
                  decoration: InputDecoration(
                      hintText: 'Ubicación',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              ListTile(
                leading: Icon(Icons.alarm),
                title: TextField(
                  controller: diasController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      suffixText: 'Dias',
                      hintText: 'Frecuencia de regado',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              ElevatedButton(
                onPressed: _readAll,
                child: Text('Get All Plants'),
              ),
              ElevatedButton(
                onPressed: _deleteAll,
                child: Text('Delete All Plants'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Ink(
                    decoration: ShapeDecoration(
                      shape: CircleBorder(),
                      color: kPrimaryColor,
                    ),
                    child: IconButton(
                        icon: Icon(
                          Icons.photo_library_outlined,
                          color: Colors.white,
                        ),
                        onPressed: _imgFromGallery),
                  ),
                  Ink(
                    decoration: ShapeDecoration(
                      color: kPrimaryColor,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                        icon: Icon(
                          Icons.photo_camera_outlined,
                          color: Colors.white,
                        ),
                        onPressed: _imgFromCamera),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _imgFromCamera() async {
    final pickedFile =
        await _picker.getImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  _imgFromGallery() async {
    final pickedFile =
        await _picker.getImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }
}

_save(String nombre, String ubicacion, String dias, File image) async {
  Plant plant = Plant();
  plant.nombre = nombre;
  plant.diasRegado = int.parse(dias);
  plant.ubicacion = ubicacion;
  plant.photoName = Utility.base64String(image.readAsBytesSync());
  DatabaseHelper helper = DatabaseHelper.instance;
  int id = await helper.insert(plant);
  print('Inserted row: $id');
}

//No borrar puede sernos util más tarde
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
