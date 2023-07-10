import 'package:http/http.dart' as http;

import '../../Const/const/export.dart';

Future getHttpWeatherData({lat, lon}) async {
  try {
    final url = '$baseUrl?lat=$lat&lon=$lon&appid=$apiKey&units=metric';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    }
  } catch (e) {
    throw Exception('Exepction Cathes');
  }
}
