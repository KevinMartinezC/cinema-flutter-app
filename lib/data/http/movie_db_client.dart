import 'package:cinema_app/config/constants/environment.dart';
import 'package:dio/dio.dart';

class MovieDbClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://api.themoviedb.org/3",
      queryParameters: {
        "api_key": Environment.movieDbKey,
      },
    ),
  );
}


