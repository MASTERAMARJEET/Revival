import 'dart:async' show Future;
import "package:flutter/services.dart" show rootBundle;
import 'dart:convert';

import './event_model.dart';

Future<String> _loadEventsAsset(String path) async {
  return await rootBundle.loadString(path);
}

List<EventDetail> _getEventList(List<dynamic> json) {
  List<EventDetail> _eventList =
      json.map((i) => EventDetail.fromJson(i)).toList();
  return _eventList;
}

Future<List<EventDetail>> loadEventList(String path) async {
  String _jsonString = await _loadEventsAsset(path);
  final _jsonResponse = json.decode(_jsonString);
  return _getEventList(_jsonResponse);
}
