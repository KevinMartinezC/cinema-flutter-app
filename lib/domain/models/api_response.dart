class ApiResponse<T> {
  final T data;
  final int? statusCode;
  final String? message;

  ApiResponse({
    required this.data,
    this.statusCode,
    this.message,
  });
}

