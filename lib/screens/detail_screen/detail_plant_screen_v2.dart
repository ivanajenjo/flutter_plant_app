import 'package:flutter/material.dart';
import 'package:flutter_plant_app/constants.dart';
import 'package:flutter_plant_app/models/plant.dart';
import 'package:flutter_plant_app/utils/database_helper.dart';

import 'components/image_and_icons.dart';

class DetailPlantScreenV2 extends StatefulWidget {
  final Plant plant;
  DetailPlantScreenV2(this.plant, {Key key}) : super(key: key);

  @override
  _DetailPlantScreenV2State createState() => _DetailPlantScreenV2State();
}

class _DetailPlantScreenV2State extends State<DetailPlantScreenV2> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildDetailScreenAppBar(widget.plant.nombre),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageAndIcons(size: size, widget: widget),
            Row(
              children: [Text(widget.plant.nombre), Text('Tontiña')],
            )
          ],
        ),
      ),
    );
  }

  AppBar buildDetailScreenAppBar([String nombre]) {
    return AppBar(
      centerTitle: true,
      title: Text(nombre),
      actions: [
        IconButton(
            icon: Icon(Icons.delete_outline),
            onPressed: () {
              _deletePlant(widget.plant);
              Navigator.pop(context);
            }),
      ],
    );
  }

  _deletePlant(Plant plant) {
    DatabaseHelper helper = DatabaseHelper.instance;
    helper.deletePlant(plant.id);
  }
}
