import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:go/src/core/core.dart';
import 'package:go/src/features/home/home.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late HomeDatasourceImpl datasource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    datasource = HomeDatasourceImpl(httpClient: mockHttpClient);
  });

  group('HomeDatasourceImpl', () {
    test('should perform a GET request to the correct URL and return a map',
        () async {
      // Arrange
      final mockResponse = {'key': 'value'};
      when(() => mockHttpClient.get(Uri.parse(Constants.kMockApi))).thenAnswer(
          (_) async => http.Response(jsonEncode(mockResponse), 200));

      // Act
      final result = await datasource.getMotelList();

      // Assert
      expect(result, equals(mockResponse));
      verify(() => mockHttpClient.get(Uri.parse(Constants.kMockApi))).called(1);
    });

    test('should throw an exception if the response is not successful',
        () async {
      // Arrange
      when(() => mockHttpClient.get(Uri.parse(Constants.kMockApi)))
          .thenAnswer((_) async => http.Response('Error', 400));

      // Act & Assert
      expect(() => datasource.getMotelList(), throwsException);
      verify(() => mockHttpClient.get(Uri.parse(Constants.kMockApi))).called(1);
    });
  });
}
