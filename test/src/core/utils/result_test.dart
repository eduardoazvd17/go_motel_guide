import 'package:flutter_test/flutter_test.dart';
import 'package:go/src/core/core.dart'; // Ajuste o caminho conforme necessário

void main() {
  group('Result', () {
    test('should return true for isSuccess when Success is used', () {
      // Arrange
      final successResult = Success<int, String>(42);

      // Assert
      expect(successResult.isSuccess, isTrue);
      expect(successResult.isError, isFalse);
    });

    test('should return true for isError when Error is used', () {
      // Arrange
      final errorResult = Error<int, String>('Some error');

      // Assert
      expect(errorResult.isSuccess, isFalse);
      expect(errorResult.isError, isTrue);
    });

    test('should return value from Success', () {
      // Arrange
      final successResult = Success<int, String>(42);

      // Act & Assert
      expect(successResult.value, 42);
      expect(successResult.error, isNull);
    });

    test('should return error from Error', () {
      // Arrange
      final errorResult = Error<int, String>('Some error');

      // Act & Assert
      expect(errorResult.error, 'Some error');
      expect(errorResult.value, isNull);
    });

    test('should correctly fold Success', () {
      // Arrange
      final successResult = Success<int, String>(42);

      // Act
      final result = successResult.fold(
        onSuccess: (value) => 'Success: $value',
        onError: (error) => 'Error: $error',
      );

      // Assert
      expect(result, 'Success: 42');
    });

    test('should correctly fold Error', () {
      // Arrange
      final errorResult = Error<int, String>('Some error');

      // Act
      final result = errorResult.fold(
        onSuccess: (value) => 'Success: $value',
        onError: (error) => 'Error: $error',
      );

      // Assert
      expect(result, 'Error: Some error');
    });

    test('should correctly map Success value', () {
      // Arrange
      final successResult = Success<int, String>(42);

      // Act
      final result = successResult.map((value) => value * 2);

      // Assert
      expect(result, isA<Success<int, String>>());
      expect(result.value, 84);
    });

    test('should return Error for map when it is Error', () {
      // Arrange
      final errorResult = Error<int, String>('Some error');

      // Act
      final result = errorResult.map((value) => value * 2);

      // Assert
      expect(result, isA<Error<int, String>>());
      expect(result.error, 'Some error');
    });

    test('should correctly mapError Error value', () {
      // Arrange
      final errorResult = Error<int, String>('Some error');

      // Act
      final result = errorResult.mapError((error) => 'Mapped: $error');

      // Assert
      expect(result, isA<Error<int, String>>());
      expect(result.error, 'Mapped: Some error');
    });

    test('should return Success for mapError when it is Success', () {
      // Arrange
      final successResult = Success<int, String>(42);

      // Act
      final result = successResult.mapError((error) => 'Mapped: $error');

      // Assert
      expect(result, isA<Success<int, String>>());
      expect(result.value, 42);
    });
  });
}
