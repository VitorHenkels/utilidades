import 'dart:convert';

import 'package:http/http.dart' as http;
class ApiService {
  /**
   * USAR API LOCAL
   * HTTP://10.0.2.2:3000
   */
  final _baseurl = "https://api-vitor-henkels.onrender.com";

  Future<String?> login(Map<String,dynamic>data) async{
    final url = Uri.parse('$_baseurl/login');

    final response = await http.post(
      url,
      headers: {'Content-Type' : 'aplication/json'},
      body: jsonEncode(data)
    );
    if (response.statusCode==200) {
      final json = jsonDecode(response.body);
      return json['token'];
    }else{
      return null;
    }
  }
}