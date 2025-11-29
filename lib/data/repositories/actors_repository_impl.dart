
import 'package:cinema_app/data/api/movie_api_client.dart';
import 'package:cinema_app/domain/models/actor.dart';
import 'package:cinema_app/domain/repositories/actors_repository.dart';

class ActorsRepositoryImpl extends ActorsRepository {
    final MovieApiClient apiClient;

  ActorsRepositoryImpl({required this.apiClient});

  @override
  Future<List<Actor>> getActorsByMovieId(String movieId) {
    return apiClient.getActorsByMovieId(movieId);
  }
}