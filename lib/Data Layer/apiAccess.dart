import 'package:dio/dio.dart';
import 'package:newapp/Data Layer/NewsAPI.dart';
import 'package:flutter/foundation.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://api.covid19api.com/summary';

  Future<news> fetchCovidList() async {
    try {
      Response response = await _dio.get(_url);
      return news.fromJson(response.data);
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occured: $error stackTrace: $stacktrace");
      }
      return news.withError("Connection issue");
    }
  }
}