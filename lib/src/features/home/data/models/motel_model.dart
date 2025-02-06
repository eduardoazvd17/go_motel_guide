import 'package:go/src/features/home/domain/entities/entities.dart';

import 'suite_model.dart';

class MotelModel extends MotelEntity {
  MotelModel({
    required super.name,
    required super.logo,
    required super.neighborhood,
    required super.distance,
    required super.favorites,
    required super.suites,
    required super.ratingQuantity,
    required super.rating,
  });

  factory MotelModel.fromMap(Map<String, dynamic> map) {
    return MotelModel(
      name: map['fantasia'],
      logo: map['logo'],
      neighborhood: map['bairro'],
      distance: map['distancia'],
      favorites: map['qtdFavoritos'],
      suites: (map['suites'] as List)
          .map((suite) => SuiteModel.fromMap(suite))
          .toList(),
      ratingQuantity: map['qtdAvaliacoes'],
      rating: map['media'],
    );
  }
}
