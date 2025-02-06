import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../../core/core.dart';

abstract class IHomeDatasource {
  Future<Map<String, dynamic>> getMotelList();
}

class HomeDatasourceImpl implements IHomeDatasource {
  final http.Client _httpClient;
  HomeDatasourceImpl({required http.Client httpClient})
      : _httpClient = httpClient;

  @override
  Future<Map<String, dynamic>> getMotelList() async {
    final response = await _httpClient.get(Uri.parse(Constants.kMockApi));
    return Map<String, dynamic>.from(jsonDecode(response.body));
  }
}
