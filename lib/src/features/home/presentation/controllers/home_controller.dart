import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home.dart';

class HomeController extends Cubit<HomeControllerState> {
  final GetMotelListUsecase _getMotelListUsecase;
  HomeController({required GetMotelListUsecase getMotelListUsecase})
      : _getMotelListUsecase = getMotelListUsecase,
        super(HomeControllerLoadingState());

  Future<void> getMotelList() async {
    emit(HomeControllerLoadingState());
    final result = await _getMotelListUsecase();
    result.fold(
      onSuccess: (success) {
        emit(
          HomeControllerSuccessState(
            motelList: success,
            discountSuites: _getDiscountSuites(success),
          ),
        );
      },
      onError: (error) => emit(HomeControllerErrorState(error: error)),
    );
  }

  List<DiscountSuiteDTO> _getDiscountSuites(List<MotelEntity> motelList) {
    final List<DiscountSuiteDTO> result = [];
    for (final motel in motelList) {
      for (final suite in motel.suites) {
        for (final period in suite.periods) {
          if (period.discount > 0) {
            result.add(
              DiscountSuiteDTO(
                name: motel.name,
                neighborhood: motel.neighborhood,
                image: suite.images.last,
                discount: period.discount,
                price: period.totalPrice,
              ),
            );
          }
        }
      }
    }
    return result;
  }
}
