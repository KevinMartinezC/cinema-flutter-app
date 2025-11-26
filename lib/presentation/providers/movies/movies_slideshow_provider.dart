

//This will be added it just to see another funtionality from providers,
// but it is not required

import 'package:cinema_app/domain/models/movie.dart';
import 'package:cinema_app/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final moviesSlideshowProvider = Provider<List<Movie>>((ref) {
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

  if (nowPlayingMovies.isEmpty) return [];

  return nowPlayingMovies.sublist(0,6);
});
