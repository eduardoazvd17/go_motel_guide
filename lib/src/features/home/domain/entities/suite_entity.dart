import 'package:go/src/features/home/domain/entities/entities.dart';

class SuiteEntity {
  final String name;
  final int quantity;
  final bool showAvailableQuantities;
  final List<String> images;
  final List<ItemEntity> itens;
  final List<CategoryEntity> categories;
  final List<PeriodsEntity> periods;

  SuiteEntity({
    required this.name,
    required this.quantity,
    required this.showAvailableQuantities,
    required this.images,
    required this.itens,
    required this.categories,
    required this.periods,
  });
}
