import 'package:cinema_app/data/models/move_result.dart';
import 'package:cinema_app/data/models/movie_datails.dart';
import 'package:cinema_app/domain/models/movie.dart';

class MovieMapper {
  static Movie movieDbToDomainModel(MovieResult movieResult) => Movie(
    adult: movieResult.adult,
    backdropPath: (movieResult.backdropPath != '')
        ? 'https://image.tmdb.org/t/p/w500${movieResult.backdropPath}'
        : "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png",
    genreIds: movieResult.genreIds.map((e) => e.toString()).toList(),
    id: movieResult.id,
    originalLanguage: movieResult.originalLanguage,
    originalTitle: movieResult.originalTitle,
    overview: movieResult.overview,
    popularity: movieResult.popularity,
    posterPath: (movieResult.posterPath != '')
        ? 'https://image.tmdb.org/t/p/w500${movieResult.posterPath}'
        : "no-poster",
    releaseDate: movieResult.releaseDate,
    title: movieResult.title,
    video: movieResult.video,
    voteAverage: movieResult.voteAverage,
    voteCount: movieResult.voteCount,
  );

  static Movie movieDetailsToDomainModel(MovieDetails movieResult) => Movie(
    adult: movieResult.adult,
    backdropPath: (movieResult.backdropPath != '')
        ? 'https://image.tmdb.org/t/p/w500${movieResult.backdropPath}'
        : "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png",
    genreIds: movieResult.genres.map((e) => e.name).toList(),
    id: movieResult.id,
    originalLanguage: movieResult.originalLanguage,
    originalTitle: movieResult.originalTitle,
    overview: movieResult.overview,
    popularity: movieResult.popularity,
    posterPath: (movieResult.posterPath != '')
        ? 'https://image.tmdb.org/t/p/w500${movieResult.posterPath}'
        : "no-poster",
    releaseDate: movieResult.releaseDate,
    title: movieResult.title,
    video: movieResult.video,
    voteAverage: movieResult.voteAverage,
    voteCount: movieResult.voteCount,
  );
}
