import 'package:flutter_test/flutter_test.dart';
import 'package:go/src/core/core.dart'; // Ajuste o caminho para onde a classe ApiError está

void main() {
  group('ApiError', () {
    test('should correctly store the error message', () {
      // Arrange
      final message = 'Error fetching motels';
      final apiError = ApiError(message: message);

      // Assert
      expect(apiError, isA<ApiError>());
      expect(apiError.message, equals(message));
    });
  });
}
