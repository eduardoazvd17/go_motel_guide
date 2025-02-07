import 'package:go/src/features/home/domain/entities/entities.dart';

class PeriodsModel extends PeriodsEntity {
  PeriodsModel({
    required super.formattedTime,
    required super.time,
    required super.price,
    required super.totalPrice,
    required super.hasCourtesy,
    required super.discount,
  });

  factory PeriodsModel.fromMap(Map<String, dynamic> map) {
    return PeriodsModel(
      formattedTime: map['tempoFormatado'],
      time: map['tempo'],
      price: map['valor'],
      totalPrice: map['valorTotal'],
      hasCourtesy: map['temCortesia'],
      discount: map['desconto']?['desconto'] ?? 0,
    );
  }
}
