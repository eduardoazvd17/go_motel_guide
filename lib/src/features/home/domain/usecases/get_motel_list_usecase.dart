import 'package:go/src/features/home/domain/repositories/home_repository.dart';

import '../../../../core/core.dart';
import '../entities/entities.dart';

abstract class IGetMotelListUsecase {
  Future<Result<List<MotelEntity>, ApiError>> call();
}

class GetMotelListUsecase implements IGetMotelListUsecase {
  final IHomeRepository _repository;
  GetMotelListUsecase({required IHomeRepository repository})
      : _repository = repository;

  @override
  Future<Result<List<MotelEntity>, ApiError>> call() async {
    return await _repository.getMotelList();
  }
}
