import 'package:flutter_test/flutter_test.dart';
import 'package:go/src/features/home/data/models/motel_model.dart';

void main() {
  group('MotelModel', () {
    test('should create a MotelModel instance from a map', () {
      // Arrange
      final map = <String, dynamic>{
        'fantasia': 'Motel 1',
        'logo': 'logo.png',
        'bairro': 'Downtown',
        'distancia': 10.5,
        'qtdFavoritos': 100,
        'suites': [
          {
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
          },
        ],
        'qtdAvaliacoes': 50,
        'media': 4.5
      };

      // Act
      final motel = MotelModel.fromMap(map);

      // Assert
      expect(motel.name, 'Motel 1');
      expect(motel.logo, 'logo.png');
      expect(motel.neighborhood, 'Downtown');
      expect(motel.distance, 10.5);
      expect(motel.favorites, 100);
      expect(motel.suites.length, 1);
      expect(motel.suites.first.name, 'Suite 1');
      expect(motel.ratingQuantity, 50);
      expect(motel.rating, 4.5);
    });

    test('should throw an exception when required keys are missing', () {
      // Arrange
      final map = <String, dynamic>{};

      // Act & Assert
      expect(() => MotelModel.fromMap(map), throwsA(isA<TypeError>()));
    });
  });
}
