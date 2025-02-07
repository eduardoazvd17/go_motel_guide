import 'package:flutter_test/flutter_test.dart';
import 'package:go/src/features/home/domain/entities/category_entity.dart';

void main() {
  group('CategoryEntity', () {
    test('should create a CategoryEntity instance', () {
      // Arrange
      final name = 'Category 1';
      final image = 'icon.png';

      // Act
      final category = CategoryEntity(name: name, image: image);

      // Assert
      expect(category.name, name);
      expect(category.image, image);
    });
  });
}
