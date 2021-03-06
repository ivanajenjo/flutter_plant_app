import 'package:flutter/material.dart';

// Colors that we use in our app
const kPrimaryColor = Color(0xFF0C9869);
const kOrangeColor = Color(0xFFE58529);
const kRedColor = Color(0xFF99143F);
const kTextColor = Color(0xFF3C4046);
const kBackgroundColor = Color(0xFFF9F8FD);
const kPrimaryColorDark = Color(0xFF00693e);
const kBlueColorDark = Color(0xFF0583A6);
const kBlueColor = Color(0xFF05B0A7);

const double kDefaultPadding = 20.0;

const String tablaPlantas = 'plantas';
const String columnId = '_id';
const String columnNombre = 'nombre';
const String columnUbicacion = 'ubicacion';
const String columnDiasRegado = 'diasRegado';
const String columnUltimoRegado = 'ultimoRegado';
const String columnPhotoName = 'photoName';

ThemeData buildThemeData(BuildContext context) {
  return ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: kPrimaryColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
      ),
    ),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: kPrimaryColor),
    scaffoldBackgroundColor: kBackgroundColor,
    primaryColor: kPrimaryColor,
    accentColor: kPrimaryColorDark,
    textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
