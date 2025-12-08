import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cinema_app/config/helpers/platform_helper.dart';

class AdaptiveFilledButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;

  const AdaptiveFilledButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return PlatformHelper.adaptive(
      ios: SizedBox(
        height: 30,
        child: CupertinoButton(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          color: CupertinoColors.darkBackgroundGray,
          borderRadius: BorderRadius.circular(10),
          onPressed: onPressed,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: CupertinoColors.white,
            ),
          ),
        ),
      ),
      android: FilledButton.tonal(
        style: ButtonStyle(
          visualDensity: VisualDensity.compact,
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
