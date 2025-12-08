import 'package:cinema_app/config/helpers/platform_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveLoadingIndicator extends StatelessWidget {
  const AdaptiveLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformHelper.adaptive(
      ios: const CupertinoActivityIndicator(radius: 24 / 2),
      android: const CircularProgressIndicator(strokeWidth: 2),
    );
  }
}
