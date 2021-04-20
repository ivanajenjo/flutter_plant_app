import 'package:flutter/material.dart';
import 'package:flutter_plant_app/widgets/appbar.dart';

class DetailPlantScreen extends StatelessWidget {
  const DetailPlantScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        child: Text('Hola'),
      ),
    );
  }
}
