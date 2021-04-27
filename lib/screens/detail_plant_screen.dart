import 'package:flutter/material.dart';
import 'package:flutter_plant_app/constants.dart';
import 'package:flutter_plant_app/models/plant.dart';
import 'package:flutter_plant_app/utils/utility.dart';
import 'package:flutter_plant_app/widgets/appbar.dart';

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
            Spacer(
              flex: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Regar'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('00:00'),
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

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}
