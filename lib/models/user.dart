import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class User {
  Future<List<Map>> fetchUsers() async {
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users'),
        headers: <String, String>{
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
        });

    var data = jsonDecode(response.body);
    List<Map> users = [];

    for (var user in data) {
      Map userTemp = {
        "name": user['name'],
        "username": user['username'],
        "email": user['email'],
        "address": {
          "street": user["address"]['street'],
          "suite": user["address"]['suite'],
          "city": user["address"]['city'],
          "zipcode": user["address"]['zipcode'],
          "geo": {
            "lat": user["address"]['geo']['lat'],
            "lng": user["address"]['geo']['lng'],
          },
        },
        "phone": user['phone'],
        "website": user['website'],
        "company": {
          "name": user['company']['name'],
          "catchPhrase": user['company']['catchPhrase'],
          "bs": user['company']['bs'],
        },
      };

      users.add(userTemp);
    }

    print(users);
    return users;
  }
}
