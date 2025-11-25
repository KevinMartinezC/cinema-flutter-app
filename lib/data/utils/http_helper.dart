import 'package:cinema_app/domain/models/api_response.dart';
import 'package:dio/dio.dart';

class HttpHelper {
  final Dio dio;

  HttpHelper(this.dio);

  /// Generic GET request
  Future<ApiResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
      );

      final data = fromJson != null
          ? fromJson(response.data as Map<String, dynamic>)
          : response.data as T;

      return ApiResponse<T>(
        data: data,
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Generic GET request that returns a list
  Future<ApiResponse<List<T>>> getList<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
      );

      final List<dynamic> dataList = response.data['results'] ?? response.data;
      final List<T> items = dataList
          .map((item) => fromJson(item as Map<String, dynamic>))
          .toList();

      return ApiResponse<List<T>>(
        data: items,
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Generic POST request
  Future<ApiResponse<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );

      final result = fromJson != null
          ? fromJson(response.data as Map<String, dynamic>)
          : response.data as T;

      return ApiResponse<T>(
        data: result,
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Generic DELETE request
  Future<ApiResponse<T?>> delete<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    try {
      final response = await dio.delete(
        path,
        queryParameters: queryParameters,
      );

      final T? result = response.data != null && fromJson != null
          ? fromJson(response.data as Map<String, dynamic>)
          : (response.data as T?);

      return ApiResponse<T?>(
        data: result,
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Generic PUT request
  Future<ApiResponse<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic>)? fromJson,
  }) async {
    try {
      final response = await dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
      );

      final result = fromJson != null
          ? fromJson(response.data as Map<String, dynamic>)
          : response.data as T;

      return ApiResponse<T>(
        data: result,
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Handle Dio errors
  String _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timeout. Please try again.';
      case DioExceptionType.badResponse:
        return 'Error: ${error.response?.statusCode} - ${error.response?.statusMessage}';
      case DioExceptionType.cancel:
        return 'Request cancelled';
      case DioExceptionType.unknown:
        return 'Network error. Please check your connection.';
      default:
        return 'An unexpected error occurred';
    }
  }
}
