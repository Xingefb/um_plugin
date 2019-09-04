import 'dart:async';

import 'package:flutter/services.dart';

class UmPlugin {
  static const MethodChannel _channel = const MethodChannel('um_plugin');

  static Future<void> setUp(String appKey) async {
    final String version =
        await _channel.invokeMethod('setup', {'appKey': appKey});
    return version;
  }

  static Future<void> setAutoPageEnabled() async {
    final String version = await _channel.invokeMethod('setAutoPageEnabled');
    return version;
  }

  static Future<void> addEvent(String id) async {
    final String version = await _channel.invokeMethod('addEvent', {'id': id});
    return version;
  }

  static Future<void> beginPage(String name) async {
    final String version =
        await _channel.invokeMethod('beginPage', {'name': name});
    return version;
  }

  static Future<void> endPage(String name) async {
    final String version =
        await _channel.invokeMethod('endPage', {'name': name});
    return version;
  }
}
