import 'package:go/src/features/home/domain/entities/entities.dart';

class MotelEntity {
  final String name;
  final String logo;
  final String neighborhood;
  final double distance;
  final int favorites;
  final List<SuiteEntity> suites;
  final int ratingQuantity;
  final double rating;

  MotelEntity({
    required this.name,
    required this.logo,
    required this.neighborhood,
    required this.distance,
    required this.favorites,
    required this.suites,
    required this.ratingQuantity,
    required this.rating,
  });
}
