
import 'package:cinema_app/data/api/movie_api_client.dart';
import 'package:cinema_app/data/repositories/actors_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorsRepositoryImpl( apiClient: MovieApiClient() );
});
