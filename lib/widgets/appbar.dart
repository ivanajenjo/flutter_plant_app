import 'package:flutter/material.dart';

AppBar buildAppBar([String nombre]) {
  if (nombre != null) {
    return AppBar(
      centerTitle: true,
      title: Text(nombre),
    );
  } else {
    return AppBar(
      centerTitle: true,
      title: Text('RiegApp'),
    );
  }
}
