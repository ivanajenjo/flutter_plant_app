import 'package:flutter/material.dart';
import 'package:flutter_plant_app/constants.dart';
import 'package:flutter_plant_app/models/plant.dart';
import 'package:flutter_plant_app/utils/utility.dart';
import 'package:flutter_plant_app/widgets/appbar.dart';

class DetailPlantScreen extends StatelessWidget {
  final Plant plant;
  const DetailPlantScreen(this.plant, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(plant.nombre),
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
                      blurRadius: 50.0,
                      spreadRadius: 10.0,
                    )
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Utility.imageFromBase64String(plant.photoName),
              ),
            ),
            Spacer(
              flex: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
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
}
