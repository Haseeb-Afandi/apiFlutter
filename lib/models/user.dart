import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class User {
  Future<dynamic> fetchUsers() async {
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users'),
        headers: <String, String>{
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
        });

    var data = jsonDecode(response.body);

    print(data);
    return data;
  }
}
