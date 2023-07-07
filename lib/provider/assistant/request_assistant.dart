import 'dart:convert';

import 'package:http/http.dart';

class RequestAssistant {

 static Future<dynamic> getRequest(String urls) async {
    final url = Uri.parse(urls);
    Response response = await get(url);
    print(json.decode(response.body));
    return json.decode(response.body);
  }
}