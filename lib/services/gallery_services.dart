import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieTest/shared_value.dart';

class GalleryServices{
  static Future getGallery(int id) async {
    Uri uri = Uri.parse("$baseURLAPI/movie/$id/images?api_key=$apiKey");

    var response = await http.get(uri);

    if (response.statusCode != 200) return json.decode(response.body);
    return json.decode(response.body);
  }
}