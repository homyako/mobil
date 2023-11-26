import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> getAddress(data) async {
  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
    'Authorization': 'Token 0c5641117db508f5b1e4697e34683814e605db8b',
  };

  final url = Uri.parse(
      'https://suggestions.dadata.ru/suggestions/api/4_1/rs/geolocate/address');
  final slka = await http.post(url, headers: headers, body: json.encode(data));
  return slka.body;
}