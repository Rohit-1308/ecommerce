// To parse this JSON data, do
//
//     final productInfo = productInfoFromJson(jsonString);

import 'dart:convert';

List<Map<String, String>> productInfoFromJson(String str) => List<Map<String, String>>.from(json.decode(str).map((x) => Map.from(x).map((k, v) => MapEntry<String, String>(k, v == null ? null : v))));

String productInfoToJson(List<Map<String, String>> data) => json.encode(List<dynamic>.from(data.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)))));
