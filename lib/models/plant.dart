import '../constants.dart';

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
    ultimoRegado = map[columnUltimoRegado];
    photoName = map[columnPhotoName];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'nombre': nombre,
      'ubicacion': ubicacion,
      'diasRegado': diasRegado,
      'ultimoRegado': ultimoRegado,
      'photoName': photoName
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  @override
  String toString() {
    return 'nombre: $nombre, ubicacion: $ubicacion, diasRegado: $diasRegado, ultimoRegado: $ultimoRegado, photoName: $photoName';
  }
}
