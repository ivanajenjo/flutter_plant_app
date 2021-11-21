import 'package:flutter/material.dart';
import 'package:flutter_plant_app/constants.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: kPrimaryColor,
    centerTitle: true,
    title: Text('RiegApp'),
  );
}

AppBar buildHomeAppBar(Function onPressed) {
  return AppBar(
    backgroundColor: kPrimaryColor,
    centerTitle: true,
    title: Text('RiegApp'),
    actions: [
      IconButton(icon: Icon(Icons.update_outlined), onPressed: onPressed)
    ],
  );
}
