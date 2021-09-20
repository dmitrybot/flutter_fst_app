import 'dart:convert';

import 'package:first_flutter_app/models/User.dart';
import 'package:http/http.dart' as http;

class UserProvider{
  
  Future<List<User>> getUser() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200){
      final userJson = json.decode(response.body);
      return userJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching users');
    }
  }
}