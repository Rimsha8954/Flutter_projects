import '../model/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserApi {
  static Future<List<User>> fetchUsers({int retries = 3}) async {
    const url = 'https://randomuser.me/api/?results=500';

    for (int attempt = 0; attempt < retries; attempt++) {
      try {
        final uri = Uri.parse(url); // Parse the URL
        final response = await http.get(uri); // Send GET request

        if (response.statusCode == 200) {
          final body = response.body;
          final json = jsonDecode(body);

          // Ensure `json['results']` exists and is a List
          if (json['results'] is! List) {
            throw Exception('Unexpected API response format');
          }

          final results = json['results'] as List<dynamic>;

          // Transform API response into a List<User>
          final users = results.map((e) {
            return User.formMap(e);
          }).toList();

          return users; // Return the transformed list of users
        } else {
          throw Exception('Server error: ${response.statusCode}');
        }
      } catch (error) {
        if (attempt == retries - 1) {
          throw Exception('Failed to fetch users after $retries attempts: $error');
        }
      }
    }

    throw Exception('Unexpected error: fetchUsers completed without returning.');
  }
}
