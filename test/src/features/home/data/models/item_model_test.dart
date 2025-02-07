import 'package:flutter_test/flutter_test.dart';
import 'package:go/src/features/home/data/models/item_model.dart';

void main() {
  group('ItemModel', () {
    test('should create an ItemModel instance from a map', () {
      // Arrange
      final map = {'nome': 'Item 1'};

      // Act
      final item = ItemModel.fromMap(map);

      // Assert
      expect(item.name, 'Item 1');
    });

    test('should throw an exception when the required key is missing', () {
      // Arrange
      final map = <String, dynamic>{};

      // Act & Assert
      expect(() => ItemModel.fromMap(map), throwsA(isA<TypeError>()));
    });
  });
}
