import 'dart:io';
import 'package:http/http.dart' as http;

/// Fetches data from a url over http
/// Throws a HttpException if 200 is not returned
Future<String> _fetchData(String url) async {
  final res = await http.get(url);

  if (res.statusCode != 200) {
    print('Error ${res.statusCode}: $url');
    throw HttpException(
      'Invalid response ${res.statusCode}',
      uri: Uri.parse(url),
    );
  }
  return res.body;
}
