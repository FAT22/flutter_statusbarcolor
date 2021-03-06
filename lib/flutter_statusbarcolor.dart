import 'dart:async';
import 'dart:ui';

import 'package:flutter/services.dart';

class FlutterStatusbarcolor {
  static const MethodChannel _channel =
      const MethodChannel('plugins.fuyumi.com/statusbar');

  static Future<Color> getStatusBarColor() =>
      _channel.invokeMethod('getstatusbarcolor').then((dynamic value) {
        return value == null ? null : Color(value);
      });
  static Future setStatusBarColor(Color color) =>
      _channel.invokeMethod('setstatusbarcolor', {'color': color.value});
  static Future setStatusBarWhiteForeground(bool useWhiteForeground) =>
      _channel.invokeMethod('setstatusbarwhiteforeground',
          {'whiteForeground': useWhiteForeground});

  static Future<Color> getNavigationBarColor() =>
      _channel.invokeMethod('getnavigationbarcolor').then((dynamic value) {
        return value == null ? null : Color(value);
      });
  static Future setNavigationBarColor(Color color) =>
      _channel.invokeMethod('setnavigationbarcolor', {'color': color.value});
  static Future setNavigationBarWhiteForeground(bool useWhiteForeground) =>
      _channel.invokeMethod('setnavigationbarwhiteforeground',
          {'whiteForeground': useWhiteForeground});
}

bool useWhiteForeground(Color color) {
  return 1.05 / (color.computeLuminance() + 0.05) > 4.5;
}
