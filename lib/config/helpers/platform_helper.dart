import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Helper class for platform-specific UI decisions
class PlatformHelper {
  /// Check if the current platform is iOS
  static bool get isIOS => Platform.isIOS;

  /// Check if the current platform is Android
  static bool get isAndroid => Platform.isAndroid;

  /// Returns a platform-adaptive widget
  /// [ios] widget to show on iOS
  /// [android] widget to show on Android
  static Widget adaptive({required Widget ios, required Widget android}) {
    return isIOS ? ios : android;
  }

  /// Returns a platform-adaptive value
  /// [ios] value to use on iOS
  /// [android] value to use on Android
  static T adaptiveValue<T>({required T ios, required T android}) {
    return isIOS ? ios : android;
  }
}

