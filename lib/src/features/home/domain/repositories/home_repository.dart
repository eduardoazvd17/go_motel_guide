import '../../../../core/core.dart';
import '../entities/entities.dart';

abstract class IHomeRepository {
  Future<Result<List<MotelEntity>, ApiError>> getMotelList();
}
