import 'package:flutter_test/flutter_test.dart';
import 'package:go/src/features/home/data/models/category_model.dart';

void main() {
  group('CategoryModel', () {
    test('should create a CategoryModel instance from a map', () {
      // Arrange
      final map = {'nome': 'Category 1', 'icone': 'icon.png'};

      // Act
      final category = CategoryModel.fromMap(map);

      // Assert
      expect(category.name, 'Category 1');
      expect(category.image, 'icon.png');
    });

    test('should throw an exception when required keys are missing', () {
      // Arrange
      final map = {'nome': 'Category 2'};

      // Act & Assert
      expect(() => CategoryModel.fromMap(map), throwsA(isA<TypeError>()));
    });

    test('should throw an exception when the map is empty', () {
      // Arrange
      final map = <String, dynamic>{};

      // Act & Assert
      expect(() => CategoryModel.fromMap(map), throwsA(isA<TypeError>()));
    });
  });
}
