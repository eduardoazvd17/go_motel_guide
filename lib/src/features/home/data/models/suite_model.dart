import 'package:go/src/features/home/domain/entities/entities.dart';

import 'models.dart';

class SuiteModel extends SuiteEntity {
  SuiteModel({
    required super.name,
    required super.quantity,
    required super.showAvailableQuantities,
    required super.images,
    required super.itens,
    required super.categories,
    required super.periods,
  });
  factory SuiteModel.fromMap(Map<String, dynamic> map) {
    return SuiteModel(
      name: map['nome'],
      quantity: map['qtd'],
      showAvailableQuantities: map['exibirQtdDisponiveis'],
      images: List<String>.from(map['fotos']),
      itens: List<ItemModel>.from(
        map['itens'].map(
          (item) => ItemModel.fromMap(item),
        ),
      ),
      categories: List<CategoryModel>.from(
        map['categoriaItens'].map(
          (category) => CategoryModel.fromMap(category),
        ),
      ),
      periods: List<PeriodsModel>.from(
        map['periodos'].map(
          (period) => PeriodsModel.fromMap(period),
        ),
      ),
    );
  }
}
