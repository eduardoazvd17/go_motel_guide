abstract class IHomeDatasource {
  Future<Map<String, dynamic>> getMotelList();
}

class HomeDatasourceImpl implements IHomeDatasource {
  @override
  Future<Map<String, dynamic>> getMotelList() async {
    throw UnimplementedError();
  }
}
