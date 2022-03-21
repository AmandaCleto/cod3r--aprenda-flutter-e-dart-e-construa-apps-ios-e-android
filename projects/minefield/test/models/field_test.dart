import 'package:flutter_test/flutter_test.dart';
import 'package:minefield/models/field.dart';

main() {
  group('Test Field', () {
    test('Open Field WITH Explosion', () {
      Field field = Field(row: 0, column: 0);
      field.toMine();

      expect(() => field.openBomb(), throwsException);
    });
    test('Open Field WITHOUT Explosion', () {
      Field field = Field(row: 0, column: 0);
      field.openBomb();

      expect(field.open, isTrue);
    });
    test('Add NOT Neighbor', () {
      Field field = Field(row: 0, column: 0);
      Field field2 = Field(row: 1, column: 3);
      field.addNeighbors(field2);

      expect(field.neighbors.isEmpty, true);
    });
    test('Add Neighbor', () {
      Field field = Field(row: 3, column: 3);
      Field field2 = Field(row: 3, column: 4);
      Field field3 = Field(row: 2, column: 2);
      Field field4 = Field(row: 4, column: 4);
      field.addNeighbors(field2);
      field.addNeighbors(field3);
      field.addNeighbors(field4);

      expect(field.neighbors.length, 3);
    });
    test('Mines in Neighborhood', () {
      Field field = Field(row: 3, column: 3);

      Field field2 = Field(row: 3, column: 4);
      field2.toMine();

      Field field3 = Field(row: 2, column: 2);

      Field field4 = Field(row: 4, column: 4);
      field4.toMine();

      field.addNeighbors(field2);
      field.addNeighbors(field3);
      field.addNeighbors(field4);

      expect(field.quantityOfNeighbors, 2);
    });
  });
}
