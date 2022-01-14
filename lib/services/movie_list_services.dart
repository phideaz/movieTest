import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieTest/shared_value.dart';

class MovieListService{
  static Future getMovieList() async {
    print("hit ini");
    Uri uri = Uri.parse("$baseURLAPI/discover/movie?api_key=$apiKey");

    var response = await http.get(uri);
    if (response.statusCode != 200) return json.decode(response.body);
    return json.decode(response.body);
  }
}