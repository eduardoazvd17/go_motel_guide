import 'package:flutter_test/flutter_test.dart';
import 'package:go/src/features/home/data/models/periods_model.dart';

void main() {
  group('PeriodsModel', () {
    test('should create a PeriodsModel from a map', () {
      // Arrange
      final map = {
        'tempoFormatado': '10:00',
        'tempo': '10',
        'valor': 100.0,
        'valorTotal': 90.0,
        'temCortesia': true,
        'desconto': {'desconto': 10.0},
      };

      // Act
      final result = PeriodsModel.fromMap(map);

      // Assert
      expect(result.formattedTime, '10:00');
      expect(result.time, '10');
      expect(result.price, 100.0);
      expect(result.totalPrice, 90.0);
      expect(result.hasCourtesy, true);
      expect(result.discount, 10.0);
    });

    test('should handle missing discount and set it to 0', () {
      // Arrange
      final map = {
        'tempoFormatado': '10:00',
        'tempo': '10',
        'valor': 100.0,
        'valorTotal': 90.0,
        'temCortesia': true,
      };

      // Act
      final result = PeriodsModel.fromMap(map);

      // Assert
      expect(result.discount, 0);
    });
  });
}
