import 'package:http/http.dart';

void findAll() async {
  final Uri url = Uri(host: '192.168.0.114:8080/transactions');
  final Response response = await get(url);
  print(response.body);
}
