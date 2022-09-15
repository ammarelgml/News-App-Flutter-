import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../failure.dart';
import '../end_points.dart';
import '../network_info.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(baseUrl: baseURL, receiveDataWhenStatusError: true));
  }

  static Future<Either<Failure, Map<String, dynamic>>> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    if (await NetworkInfo(InternetConnectionChecker()).isConnected) {
      try {
        Response response = await dio!.get(url, queryParameters: query);
        print('/// response $response');
        if (response.statusCode != 200) {
          print('/// statusCode ${response.statusCode}');
          return Left(Failure(response.statusCode!, 'Status code error!'));
        }
        print('/// all Good data ${response.data}');
        return Right(response.data);
      } catch (exception) {
        print('/// catch ${exception.toString()}');
        return Left(Failure(2, exception.toString()));
      }
    } else {
      print('/// No internet }');
      return Left(Failure(1, 'No internet connection'));
    }
  }
}
