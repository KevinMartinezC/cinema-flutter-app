import 'package:cinema_app/config/helpers/platform_helper.dart';
import 'package:cinema_app/presentation/delegates/search_movie_delegate.dart';
import 'package:cinema_app/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStye = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
      bottom: false, //to remove big bottom padding
      top: true, // Ensure it starts from the top
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: SizedBox(
          width: double.infinity, //all the width available
          child: Row(
            children: [
              Icon(
                PlatformHelper.isIOS
                    ? CupertinoIcons.film
                    : Icons.movie_outlined,
                color: colors.primary,
              ),
              const SizedBox(width: 8),
              Text("Cinema", style: titleStye),

              const Spacer(),

              IconButton(
                onPressed: () {
                  final movieRepository = ref.read(movieRepositoryProvider);
                  showSearch(
                    context: context,
                    delegate: SearchMovieDelegate(
                      searchMovies: movieRepository.searchMovies,
                    ),
                  );
                },
                icon: Icon(
                  PlatformHelper.isIOS ? CupertinoIcons.search : Icons.search,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
