import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphical_abstract/theme/theme_const.dart';
import 'package:http/http.dart' as http;

//* The return type of all API requests will be either Success or Failure.
//* See status_code.dart for more details.
//* It's an warper class for API responses.
class API {
  //* All API requests are made using this method.
  //* It will handle all success and failure responses.
  //* It will handle to pass api_key, api_secret and system_id to all requests.
  static Future<dynamic> post(String url, {Map<String, dynamic>? body}) async {
    //* All requests are made using post method.
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(body),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${const String.fromEnvironment('OPENAI', defaultValue: '')}",
      },
    );

    if (response.statusCode == 200) {
      return Success(data: jsonDecode(response.body));
    } else {
      try {
        return Failure(message: "Something went wrong.", data: jsonDecode(response.body));
      } catch (e) {
        return Failure(message: "Something went wrong", data: []);
      }
    }
  }

  static Future<Object> get(String url, Map<String, dynamic> params, {String? customToken}) async {
    try {
      final response = await http.get(
        Uri.parse(url).replace(queryParameters: params),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdGFmZk1vZGVsRGF0YSI6eyJfaWQiOiI2NTYzMjE0MDU2M2U2Y2RlZTMzNWIyOGYiLCJ1aWQiOiI3ZjY3NWQ1OC01MzU4LTRhNjMtYmUxMS01NWU4MTdlNTJiNzMiLCJuYW1lIjoiRGVtbyIsImVtYWlsIjoiZGVtb0Bob3p6b3dhc2guY29tIiwiZGVwYXJ0bWVudCI6InN1cGVyX2FkbWluIiwicGhvbmUiOiI5OTk1MzM5NzEzIiwicGFzc3dvcmQiOiJzaGExJGZhMGNjZmIwJDEkZDNjN2NjYzc4YTQ4ODNiNjllNTgzNTVlOTk0NzI3MGQyOTE1YTM5ZSIsImJyaWQiOiI1NTc2IiwiY3JlYXRlZF9hdCI6IjIwMjMtMTEtMjZUMTA6NDM6MTIuNDA5WiIsInVwZGF0ZWRfYXQiOiIyMDIzLTExLTI2VDEwOjQzOjEyLjQwOVoiLCJfX3YiOjB9LCJpYXQiOjE3MDExODI0ODAsImV4cCI6MTcwMTI2ODg4MH0.QPMkOkxfxHN3FBTSe6J2-alVs5u9cgi-33kOTgpVma4",
        },
      );
      if (response.statusCode == 200) {
        return Success(data: jsonDecode(response.body));
      }

      return response;
    } catch (e) {
      return Failure(message: "Something went wrong", data: []);
    }
  }
}

//* API responses are wrapped in Success and Failure classes.

class Success {
  Success({this.data});
  final dynamic data;
}

class Failure {
  Failure({required this.message, this.data});
  final String message;
  final dynamic data;
}
