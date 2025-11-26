class PaginatedResponse<T> {
  final List<T> results;
  final int page;
  final int totalPages;
  final int totalResults;

  PaginatedResponse({
    required this.results,
    required this.page,
    required this.totalPages,
    required this.totalResults,
  });

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return PaginatedResponse<T>(
      results: (json['results'] as List)
          .map((item) => fromJsonT(item as Map<String, dynamic>))
          .toList(),
      page: json['page'] as int,
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );
  }
}
