import 'package:go/src/features/home/domain/entities/entities.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({required super.name, required super.image});

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      name: map['nome'],
      image: map['icone'],
    );
  }
}
