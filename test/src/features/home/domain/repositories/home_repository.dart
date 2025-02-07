import 'package:flutter_test/flutter_test.dart';
import 'package:go/src/features/home/domain/usecases/get_motel_list_usecase.dart';
import 'package:go/src/features/home/domain/repositories/home_repository.dart';
import 'package:go/src/features/home/domain/entities/motel_entity.dart';
import 'package:go/src/core/core.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeRepository extends Mock implements IHomeRepository {}

void main() {
  late MockHomeRepository mockRepository;
  late GetMotelListUsecase usecase;

  setUp(() {
    mockRepository = MockHomeRepository();
    usecase = GetMotelListUsecase(repository: mockRepository);
  });

  group('GetMotelListUsecase', () {
    test('should return a list of MotelEntity on success', () async {
      // Arrange
      final motelList = <MotelEntity>[];
      when(mockRepository.getMotelList)
          .thenAnswer((_) async => Success(motelList));

      // Act
      final result = await usecase.call();

      // Assert
      expect(result.isSuccess, true);
      expect(result.value, motelList);
    });

    test('should return an ApiError on failure', () async {
      // Arrange
      final apiError = ApiError(message: 'Error fetching motels');
      when(mockRepository.getMotelList)
          .thenAnswer((_) async => Error(apiError));

      // Act
      final result = await usecase.call();

      // Assert
      expect(result.isError, true);
      expect(result.error, apiError);
    });
  });
}
