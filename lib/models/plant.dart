import 'package:flutter/material.dart';

import '../constants.dart';

/// Modelo de la planta para la aplicación.
class Plant {
  int id;
  String nombre;
  String ubicacion;
  int diasRegado;
  DateTime ultimoRegado;
  String photoName;

  Plant();

  Plant.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    nombre = map[columnNombre];
    ubicacion = map[columnUbicacion];
    diasRegado = map[columnDiasRegado];
    if (map[columnUltimoRegado] != null) {
      ultimoRegado = DateTime.tryParse(map[columnUltimoRegado]);
    } else {
      ultimoRegado = null;
    }
    photoName = map[columnPhotoName];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'nombre': nombre,
      'ubicacion': ubicacion,
      'diasRegado': diasRegado,
      'ultimoRegado': ultimoRegado.toString(),
      'photoName': photoName
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  @override
  String toString() {
    return 'nombre: $nombre, ubicacion: $ubicacion, diasRegado: $diasRegado, ultimoRegado: $ultimoRegado';
  }

  ///El metodo compare to se utiliza para colocar las plantas en orden en la lista nos permite ordenar las plantas en funcion de cuanto tiempo nos queda hasta que estas sean regadas.
  ///Por mantener un poco la coherencia y posibles reutilizaciones de el metodo se ordena según dias hasta regar de Mayor a Menor (>). Pero realmente el orden que nos interesa es el inverso,
  ///por tanto la lista obtenida en el databaseHelper se invierte.

  int compareTo(Plant plant) {
    if (this.diasHastaRegar() == null || plant.diasHastaRegar() == null) {
      return null;
    }

    if (this.diasHastaRegar() < plant.diasHastaRegar()) {
      return 1;
    }

    if (this.diasHastaRegar() > plant.diasHastaRegar()) {
      return -1;
    }

    if (this.diasHastaRegar() == plant.diasHastaRegar()) {
      return 0;
    }

    return 0;
  }

  int diasHastaRegar() {
    if (ultimoRegado == null) {
      return 10;
    } else {
      final date = DateTime.now();
      int proximoRegado = date.difference(ultimoRegado).inDays;
      int diasHastaRegado = diasRegado - proximoRegado;
      return diasHastaRegado;
    }
  }

  Color getColor() {
    if (diasHastaRegar() > 1) {
      return kPrimaryColor;
    } else if (diasHastaRegar() == 1) {
      return kOrangeColor;
    } else {
      return kRedColor;
    }
  }
}
