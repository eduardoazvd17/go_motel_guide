import 'package:flutter_test/flutter_test.dart';
import 'package:go/src/features/home/domain/entities/periods_entity.dart';

void main() {
  group('PeriodsEntity', () {
    test('should create a PeriodsEntity instance', () {
      // Arrange
      final formattedTime = '10:00 AM - 12:00 PM';
      final time = '10:00 AM - 12:00 PM';
      final price = 100.0;
      final totalPrice = 90.0;
      final hasCourtesy = true;
      final discount = 10.0;

      // Act
      final period = PeriodsEntity(
        formattedTime: formattedTime,
        time: time,
        price: price,
        totalPrice: totalPrice,
        hasCourtesy: hasCourtesy,
        discount: discount,
      );

      // Assert
      expect(period.formattedTime, formattedTime);
      expect(period.time, time);
      expect(period.price, price);
      expect(period.totalPrice, totalPrice);
      expect(period.hasCourtesy, hasCourtesy);
      expect(period.discount, discount);
    });
  });
}
