import 'package:cinema_app/presentation/widgets/shared/adaptive_loading_indicator.dart';
import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Loading movies..."),
          const SizedBox(height: 10),
          const AdaptiveLoadingIndicator()
        ],
      ),
    );
  }
}