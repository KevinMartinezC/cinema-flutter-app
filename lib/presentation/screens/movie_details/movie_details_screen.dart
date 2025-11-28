import 'package:flutter/material.dart';

class MovieDetailScreen extends StatefulWidget {
  static const name = 'movie-screen';

  final String movieId;

  const MovieDetailScreen({super.key, required this.movieId});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {

  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieID: ${widget.movieId}'),
      ));
  }
}
