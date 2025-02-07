import 'package:flutter_test/flutter_test.dart';
import 'package:go/src/features/home/domain/entities/motel_entity.dart';
import 'package:go/src/features/home/domain/entities/suite_entity.dart';

void main() {
  group('MotelEntity', () {
    test('should create a MotelEntity instance', () {
      // Arrange
      final name = 'Motel 1';
      final logo = 'logo.png';
      final neighborhood = 'Downtown';
      final distance = 10.5;
      final favorites = 100;
      final suites = <SuiteEntity>[];
      final ratingQuantity = 50;
      final rating = 4.5;

      // Act
      final motel = MotelEntity(
        name: name,
        logo: logo,
        neighborhood: neighborhood,
        distance: distance,
        favorites: favorites,
        suites: suites,
        ratingQuantity: ratingQuantity,
        rating: rating,
      );

      // Assert
      expect(motel.name, name);
      expect(motel.logo, logo);
      expect(motel.neighborhood, neighborhood);
      expect(motel.distance, distance);
      expect(motel.favorites, favorites);
      expect(motel.suites, suites);
      expect(motel.ratingQuantity, ratingQuantity);
      expect(motel.rating, rating);
    });
  });
}
