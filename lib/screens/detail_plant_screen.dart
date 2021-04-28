import 'package:flutter/material.dart';
import 'package:flutter_plant_app/constants.dart';
import 'package:flutter_plant_app/models/plant.dart';
import 'package:flutter_plant_app/utils/database_helper.dart';
import 'package:flutter_plant_app/utils/utility.dart';
import 'package:flutter_plant_app/widgets/appbar.dart';
import 'package:intl/intl.dart';

class DetailPlantScreen extends StatefulWidget {
  final Plant plant;
  const DetailPlantScreen(this.plant, {Key key}) : super(key: key);

  @override
  _DetailPlantScreenState createState() => _DetailPlantScreenState();
}

class _DetailPlantScreenState extends State<DetailPlantScreen> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(widget.plant.nombre),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: kPrimaryColor,
                      blurRadius: 8.0,
                      spreadRadius: 1.0,
                    )
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Utility.imageFromBase64String(widget.plant.photoName),
              ),
            ),
            ListTile(
              title: Text(widget.plant.ubicacion),
              subtitle: Text('Ubicación'),
              leading: Icon(Icons.pin_drop_outlined),
            ),
            buildListTileDate(),
            ListTile(
              title: Text('${widget.plant.diasRegado.toString()} Dias'),
              subtitle: Text('Frecuencia de Regado'),
              leading: Icon(Icons.water_damage_outlined),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _selectDate(context);
                  },
                  child: Text('Regar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.plant.ultimoRegado = DateTime.now();
                    print(widget.plant.ultimoRegado);
                    _updateRegado(widget.plant);
                    setState(() {});
                  },
                  child: Row(
                    children: [
                      Icon(Icons.water_damage_outlined),
                      Text(_calcularProximoRegado(widget.plant)),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    );
  }

  ListTile buildListTileDate() {
    if (widget.plant.ultimoRegado != null) {
      return ListTile(
        title: Text(_formatDate(widget.plant.ultimoRegado)),
        subtitle: Text('Último Regado'),
        leading: Icon(Icons.calendar_today_outlined),
      );
    } else {
      return ListTile(
        title: Text('No se ha regado'),
        subtitle: Text('Último Regado'),
        leading: Icon(Icons.calendar_today_outlined),
      );
    }
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      widget.plant.ultimoRegado = selectedDate;
      _updateRegado(widget.plant);
      print(widget.plant);
    }
  }

  _updateRegado(Plant plant) async {
    DatabaseHelper helper = DatabaseHelper.instance;
    helper.update(plant);
  }

  String _formatDate(DateTime date) {
    final dF = DateFormat.yMMMd();
    return dF.format(date);
  }

  String _calcularProximoRegado(Plant plant) {
    if (plant.ultimoRegado != null) {
      final date = DateTime.now();
      final difference = date.difference(plant.ultimoRegado).inDays;
      final diasHastaRegado = plant.diasRegado - difference;
      return '$diasHastaRegado dias';
    } else {
      return 'Sin Regar';
    }
  }
}
