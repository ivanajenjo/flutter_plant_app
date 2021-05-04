import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    centerTitle: true,
    title: Text('RiegApp'),
  );
}

AppBar buildHomeAppBar(Function onPressed) {
  return AppBar(
    centerTitle: true,
    title: Text('RiegApp'),
    actions: [
      IconButton(icon: Icon(Icons.update_outlined), onPressed: onPressed)
    ],
  );
}
