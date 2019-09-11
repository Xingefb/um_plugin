import 'dart:async';

import 'package:flutter/services.dart';

class UmPlugin {
  static const MethodChannel _channel = const MethodChannel('um_plugin');

  static Future<void> setUp(String appKey, {String channel}) async {
    await _channel
        .invokeMethod('setup', {'appKey': appKey, 'channel': channel});
  }

  static Future<void> setAutoPageEnabled() async {
    await _channel.invokeMethod('setAutoPageEnabled');
  }

  static Future<void> addEvent(String id, {String label}) async {
    await _channel.invokeMethod('addEvent', {'eventId': id, 'label': label});
  }

  static Future<void> eventDict(String id, {Map dict}) async {
    await _channel.invokeMethod('addEvent', {'eventId': id, 'dict': dict});
  }

  static Future<void> beginPage(String name) async {
    await _channel.invokeMethod('beginPage', {'name': name});
  }

  static Future<void> endPage(String name) async {
    await _channel.invokeMethod('endPage', {'name': name});
  }
}
