import 'package:flutter_test/flutter_test.dart';
import 'package:go/src/features/home/domain/entities/item_entity.dart';

void main() {
  group('ItemEntity', () {
    test('should create an ItemEntity instance', () {
      // Arrange
      final name = 'Item 1';

      // Act
      final item = ItemEntity(name: name);

      // Assert
      expect(item.name, name);
    });
  });
}
