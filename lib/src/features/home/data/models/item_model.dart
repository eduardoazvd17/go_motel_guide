import '../../domain/entities/entities.dart';

class ItemModel extends ItemEntity {
  ItemModel({required super.name});

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(name: map['nome']);
  }
}
