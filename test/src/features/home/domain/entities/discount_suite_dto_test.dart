import 'package:flutter_test/flutter_test.dart';
import 'package:go/src/features/home/domain/entities/discount_suite_dto.dart';

void main() {
  group('DiscountSuiteDTO', () {
    test('should create a DiscountSuiteDTO instance', () {
      // Arrange
      final name = 'Discount Suite 1';
      final neighborhood = 'City Center';
      final image = 'discount.png';
      final discount = 20.0;
      final price = 150.0;

      // Act
      final discountSuite = DiscountSuiteDTO(
        name: name,
        neighborhood: neighborhood,
        image: image,
        discount: discount,
        price: price,
      );

      // Assert
      expect(discountSuite.name, name);
      expect(discountSuite.neighborhood, neighborhood);
      expect(discountSuite.image, image);
      expect(discountSuite.discount, discount);
      expect(discountSuite.price, price);
    });
  });
}
