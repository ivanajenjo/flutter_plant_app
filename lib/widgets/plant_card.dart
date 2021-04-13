import 'package:flutter/material.dart';

class PlantCard extends StatelessWidget {
  const PlantCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.arrow_drop_down_circle),
            title: Text('Nombre de la planta'),
          ),
          Text('Card'),
          Image.asset('assets/images/plant.jpg')
        ],
      ),
      clipBehavior: Clip.antiAlias,
    );
  }
}
