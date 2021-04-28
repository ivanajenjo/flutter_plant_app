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
}
