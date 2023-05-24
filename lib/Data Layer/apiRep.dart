import 'package:newapp/Data Layer/NewsAPI.dart';
import 'apiAccess.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<news> fetchCovidList() {
    return _provider.fetchCovidList();
  }
}

class NetworkError extends Error {}