import 'package:cinema_app/domain/models/movie.dart';

abstract class MovieRepository {
    Future<List<Movie>> getNowPlaying({int page = 1});
}
