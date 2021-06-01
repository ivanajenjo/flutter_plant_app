import 'package:flutter/material.dart';
import 'package:flutter_plant_app/constants.dart';
import 'package:flutter_plant_app/models/plant.dart';
import 'package:flutter_plant_app/utils/database_helper.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/detail_text.dart';
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
            DetailText(widget: widget)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding / 2),
          child: SvgPicture.asset("assets/icons/gran-gota-de-agua.svg"),
        ),
        onPressed: _regarPlanta,
      ),
    );
  }

  void _regarPlanta() {
    widget.plant.ultimoRegado = DateTime.now();
    print(widget.plant.ultimoRegado);
    _updateRegado(widget.plant);
    setState(() {});
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

  _updateRegado(Plant plant) async {
    DatabaseHelper helper = DatabaseHelper.instance;
    helper.update(plant);
  }

  _deletePlant(Plant plant) {
    DatabaseHelper helper = DatabaseHelper.instance;
    helper.deletePlant(plant.id);
  }
}
