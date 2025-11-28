import 'package:cinema_app/domain/models/movie.dart';
import 'package:cinema_app/presentation/providers/providers.dart';
import 'package:flutter_riverpod/legacy.dart';

final movieInfoProvider = StateNotifierProvider((ref) {
      final fetchMovieInfoById = ref.watch(movieRepositoryProvider).getMovieById;
      return MovieMapProvider(getMovies: fetchMovieInfoById);
    });

typedef GetMovieCallback = Future<Movie> Function(String movieId);

class MovieMapProvider extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallback getMovies;

  MovieMapProvider({required this.getMovies}) : super({});

  Future<void> loadMoview(String movieId) async {
    if (state[movieId] != null) return;

    final movie = await getMovies(movieId);

    state = {...state, movieId: movie};
  }
}
