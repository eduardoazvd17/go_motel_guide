import '../../../../core/core.dart';
import '../../home.dart';

abstract class HomeControllerState {}

class HomeControllerLoadingState extends HomeControllerState {}

class HomeControllerErrorState extends HomeControllerState {
  final ApiError error;
  HomeControllerErrorState({required this.error});
}

class HomeControllerSuccessState extends HomeControllerState {
  final List<MotelEntity> motelList;
  final List<DiscountSuiteDTO> discountSuites;
  HomeControllerSuccessState({
    required this.motelList,
    required this.discountSuites,
  });
}
