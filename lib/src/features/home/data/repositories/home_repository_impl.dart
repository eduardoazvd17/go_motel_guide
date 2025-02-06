import 'package:go/src/core/errors/api_error.dart';

import 'package:go/src/core/utils/result.dart';
import 'package:go/src/features/home/data/datasources/home_datasource.dart';
import 'package:go/src/features/home/data/models/models.dart';

import 'package:go/src/features/home/domain/entities/motel_entity.dart';

import '../../domain/repositories/repositories.dart';

class HomeRepositoryImpl implements IHomeRepository {
  final IHomeDatasource _datasource;
  HomeRepositoryImpl({required IHomeDatasource datasource})
      : _datasource = datasource;

  @override
  Future<Result<List<MotelEntity>, ApiError>> getMotelList() async {
    try {
      final result = await _datasource.getMotelList();
      final resultList = List<Map<String, dynamic>>.from(result['moteis']);
      return Success(resultList.map((e) => MotelModel.fromMap(e)).toList());
    } catch (e) {
      return Error(ApiError(message: e.toString()));
    }
  }
}
