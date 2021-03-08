import 'dart:async' show Future;
import "package:flutter/services.dart" show rootBundle;
import 'dart:convert';

import './revival_model.dart';

Future<String> _loadRevivalAsset(String path) async {
  return await rootBundle.loadString(path);
}

Future<RevivalDetail> loadRevivalDetail(String path) async {
  String _jsonString = await _loadRevivalAsset(path);
  final _jsonResponse = json.decode(_jsonString);
  RevivalDetail _revivalDetail = RevivalDetail.fromJson(_jsonResponse);
  return _revivalDetail;
}
