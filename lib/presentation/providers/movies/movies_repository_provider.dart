import 'package:cinema_app/data/api/movie_api_client.dart';
import 'package:cinema_app/data/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// this repository is immutable 
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(apiClient: MovieApiClient());
});
