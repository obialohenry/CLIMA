import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  final String url;

  Networking(this.url);

  Future<Map<String, dynamic>> network() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode >= 200 && response.statusCode < 300  ) {
      var data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
      print(response.body);
      throw {"Failed to load decoded data!"};
    }
  }
}