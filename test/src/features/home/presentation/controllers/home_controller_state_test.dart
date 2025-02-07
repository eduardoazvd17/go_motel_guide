import 'package:flutter_test/flutter_test.dart';
import 'package:go/src/features/home/home.dart';
import 'package:go/src/core/core.dart';

void main() {
  group('HomeControllerState', () {
    test(
        'HomeControllerLoadingState should be a subclass of HomeControllerState',
        () {
      // Arrange & Act
      final state = HomeControllerLoadingState();

      // Assert
      expect(state, isA<HomeControllerState>());
      expect(state, isA<HomeControllerLoadingState>());
    });

    test('HomeControllerErrorState should correctly store an error', () {
      // Arrange
      final apiError = ApiError(message: 'Error fetching motels');
      final state = HomeControllerErrorState(error: apiError);

      // Assert
      expect(state, isA<HomeControllerErrorState>());
      expect(state.error, equals(apiError));
    });

    test(
        'HomeControllerSuccessState should correctly store motel list and discount suites',
        () {
      // Arrange
      final motelList = <MotelEntity>[];
      final discountSuites = <DiscountSuiteDTO>[];
      final state = HomeControllerSuccessState(
        motelList: motelList,
        discountSuites: discountSuites,
      );

      // Assert
      expect(state, isA<HomeControllerSuccessState>());
      expect(state.motelList, equals(motelList));
      expect(state.discountSuites, equals(discountSuites));
    });
  });
}
