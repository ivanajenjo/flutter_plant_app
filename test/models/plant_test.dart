import 'package:test/test.dart';
import 'package:flutter_plant_app/models/plant.dart';

void main() {
  group('Plant Constructor and Basic', () {
    test('Default plant constructor should start all null', () {
      final plant = Plant();
      expect(plant.id, null);
      expect(plant.diasRegado, null);
      expect(plant.nombre, null);
      expect(plant.photoName, null);
      expect(plant.ubicacion, null);
      expect(plant.ultimoRegado, null);
    });

    test('Adding properties to a plant', () {
      final plant = Plant();
      plant.nombre = 'PlantTest';
      plant.id = 3;
      plant.diasRegado = 10;
      expect(plant.nombre, 'PlantTest');
      expect(plant.id, 3);
      expect(plant.diasRegado, 10);
    });
  });

  group('Plant Methods', () {
    final plant = Plant();
    plant.diasRegado = 6;
    plant.ultimoRegado = DateTime.now();
    test('diasHastaRegar method default', () {
      expect(plant.diasHastaRegar(), 6);
    });

    test('diasHastaRegar 1 day ago', () {
      plant.ultimoRegado = DateTime.now().subtract(Duration(days: 1));
      expect(plant.diasHastaRegar(), 5);
    });

    test('diasHastaRegar 2 days ago', () {
      plant.ultimoRegado = DateTime.now().subtract(Duration(days: 2));
      expect(plant.diasHastaRegar(), 4);
    });

    test('compareTo', () {
      final plant1 = Plant();
      final plant2 = Plant();
      plant1.diasRegado = 10;
      plant2.diasRegado = 6;
      plant1.ultimoRegado = DateTime.now();
      plant2.ultimoRegado = DateTime.now();
      expect(plant1.compareTo(plant2), -1);
    });
  });
}
