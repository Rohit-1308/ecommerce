import 'dart:convert';

import 'package:http/http.dart' as http;

const String appURL = "https://ewiz.gq/android";

class BaseClient {
  var client = http.Client();

  Object? object;
  Future<dynamic> get(String api) async {
    var url = Uri.parse(appURL);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "some error occured";
    }
  }

  Future<dynamic> post(String api) async {
    var url = Uri.parse(appURL);
    var payload = json.encode(object);

    var response = await client.post(url, body: payload);

    if (response.statusCode == 201 || response.statusCode == 200) {
      return response.body;
    } else {
      return "some error occurred";
    }
  }

  Future<dynamic> put(String api) async {}
  Future<dynamic> delete(String api) async {}
}
