import 'package:flutter_test/flutter_test.dart';
import 'package:go/src/features/home/data/models/suite_model.dart';

void main() {
  group('SuiteModel', () {
    test('should create a SuiteModel instance from a map', () {
      // Arrange
      final map = <String, dynamic>{
        'nome': 'Suite 1',
        'qtd': 2,
        'exibirQtdDisponiveis': true,
        'fotos': ['photo1.png', 'photo2.png'],
        'itens': [
          {'nome': 'Item 1'}
        ],
        'categoriaItens': [
          {'nome': 'Category 1', 'icone': 'icon.png'}
        ],
        'periodos': [
          {
            'tempoFormatado': '10:00',
            'tempo': '10',
            'valor': 100.0,
            'valorTotal': 90.0,
            'temCortesia': true,
            'desconto': {'desconto': 10.0},
          }
        ]
      };

      // Act
      final suite = SuiteModel.fromMap(map);

      // Assert
      expect(suite.name, 'Suite 1');
      expect(suite.quantity, 2);
      expect(suite.showAvailableQuantities, true);
      expect(suite.images.length, 2);
      expect(suite.itens.length, 1);
      expect(suite.categories.length, 1);
      expect(suite.periods.length, 1);
    });

    test('should throw an exception when required keys are missing', () {
      // Arrange
      final map = <String, dynamic>{};

      // Act & Assert
      expect(() => SuiteModel.fromMap(map), throwsA(isA<TypeError>()));
    });
  });
}
