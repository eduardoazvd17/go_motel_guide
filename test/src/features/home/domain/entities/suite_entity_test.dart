import 'package:flutter_test/flutter_test.dart';
import 'package:go/src/features/home/domain/entities/suite_entity.dart';
import 'package:go/src/features/home/domain/entities/item_entity.dart';
import 'package:go/src/features/home/domain/entities/category_entity.dart';
import 'package:go/src/features/home/domain/entities/periods_entity.dart';

void main() {
  group('SuiteEntity', () {
    test('should create a SuiteEntity instance', () {
      // Arrange
      final name = 'Suite 1';
      final quantity = 2;
      final showAvailableQuantities = true;
      final images = ['image1.png', 'image2.png'];
      final itens = [ItemEntity(name: 'Item 1')];
      final categories = [
        CategoryEntity(name: 'Category 1', image: 'icon.png')
      ];
      final periods = [
        PeriodsEntity(
          formattedTime: '10:00 AM - 12:00 PM',
          time: '10:00 AM - 12:00 PM',
          price: 100.0,
          totalPrice: 90.0,
          hasCourtesy: true,
          discount: 10.0,
        )
      ];

      // Act
      final suite = SuiteEntity(
        name: name,
        quantity: quantity,
        showAvailableQuantities: showAvailableQuantities,
        images: images,
        itens: itens,
        categories: categories,
        periods: periods,
      );

      // Assert
      expect(suite.name, name);
      expect(suite.quantity, quantity);
      expect(suite.showAvailableQuantities, showAvailableQuantities);
      expect(suite.images, images);
      expect(suite.itens, itens);
      expect(suite.categories, categories);
      expect(suite.periods, periods);
    });
  });
}
