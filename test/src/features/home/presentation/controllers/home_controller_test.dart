import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go/src/features/home/home.dart';
import 'package:go/src/core/core.dart';
import 'package:mocktail/mocktail.dart';

class MockGetMotelListUsecase extends Mock implements GetMotelListUsecase {}

void main() {
  late MockGetMotelListUsecase mockGetMotelListUsecase;
  late HomeController homeController;

  setUp(() {
    mockGetMotelListUsecase = MockGetMotelListUsecase();
    homeController =
        HomeController(getMotelListUsecase: mockGetMotelListUsecase);
  });

  group(
    'HomeController',
    () {
      blocTest<HomeController, HomeControllerState>(
        'should emit loading state and then success state when getting motels succeeds',
        build: () => homeController,
        act: (bloc) async {
          final motelList = <MotelEntity>[];
          when(() => mockGetMotelListUsecase())
              .thenAnswer((_) async => Success(motelList));
          await bloc.getMotelList(); // Aguarda o método assíncrono
        },
        expect: () => [
          isA<HomeControllerLoadingState>(),
          isA<HomeControllerSuccessState>()
              .having((state) => state.motelList, 'motelList', <MotelEntity>[]).having(
                  (state) => state.discountSuites,
                  'discountSuites', <DiscountSuiteDTO>[]),
        ],
      );

      blocTest<HomeController, HomeControllerState>(
        'should emit loading state and then error state when getting motels fails',
        build: () => homeController,
        act: (bloc) async {
          final apiError = ApiError(message: 'Error fetching motels');
          when(() => mockGetMotelListUsecase())
              .thenAnswer((_) async => Error(apiError));
          await bloc.getMotelList(); // Aguarda o método assíncrono
        },
        expect: () => [
          isA<HomeControllerLoadingState>(),
          isA<HomeControllerErrorState>(),
        ],
      );

      blocTest<HomeController, HomeControllerState>(
        'should generate DiscountSuiteDTO list correctly',
        build: () => homeController,
        act: (bloc) async {
          final motel = MotelEntity(
            name: 'Motel 1',
            logo: 'logo',
            neighborhood: 'Neighborhood 1',
            distance: 1.0,
            favorites: 10,
            suites: [
              SuiteEntity(
                name: 'Suite 1',
                quantity: 2,
                showAvailableQuantities: true,
                images: ['image1'],
                itens: [],
                categories: [],
                periods: [
                  PeriodsEntity(
                    formattedTime: '10:00 - 12:00',
                    time: '10:00 - 12:00',
                    price: 100.0,
                    totalPrice: 90.0,
                    hasCourtesy: true,
                    discount: 10.0,
                  ),
                ],
              ),
            ],
            ratingQuantity: 100,
            rating: 4.5,
          );
          final motelList = [motel];
          when(() => mockGetMotelListUsecase())
              .thenAnswer((_) async => Success(motelList));
          await bloc.getMotelList(); // Aguarda o método assíncrono
        },
        expect: () => [
          isA<HomeControllerLoadingState>(),
          isA<HomeControllerSuccessState>()
              .having(
                (state) => state.discountSuites.first.name,
                'discountSuite name',
                'Motel 1',
              )
              .having(
                (state) => state.discountSuites.first.discount,
                'discountSuite discount',
                10.0,
              )
              .having(
                (state) => state.discountSuites.first.price,
                'discountSuite price',
                90.0,
              ),
        ],
      );
    },
  );
}
