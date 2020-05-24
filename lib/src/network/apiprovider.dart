import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

class ApiProvider {
  final String _baseUrl =
      "http://heatseasons.com/ClinicManagementSystemVer1/public/api/";

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(_baseUrl + url);
      responseJson = _response(response);
    } on SocketException {
      throw Exception;
    }
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body) async {
    var response;
    response = await http.post(
      _baseUrl + url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(body),
    );

    return response;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
    }
  }
}
