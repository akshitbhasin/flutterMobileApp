import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  Future<LoginApiResponse> apiCallLogin(Map<String, dynamic> param) async {
    String body = json.encode(param);
    print(body);
    var url = Uri.parse('http://localhost:5000/api/users');
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);

    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    final data = jsonDecode(response.body);
    // print(data);
    return LoginApiResponse(
        id: data["id"],
        name: data["name"],
        username: data["username"],
        password: data["password"],
        email: data["email"],
        bio: data["bio"],
        avatar_url: data["avatar_url"],
        html_url: data["html_url"],
        interests: data["interests"],
        isReferer: data["isReferer"],
        locations: data["locations"],
        resume: data["resume"],
        createdAt: data["createdAt"],
        updatedAt: data["updatedAt"]);
  }
}

class LoginApiResponse {
  final int? id;
  final String? name;
  final String? username;
  final String? password;
  final String? email;
  final String? bio;
  final String? avatar_url;
  final String? html_url;
  final String? interests;
  final int? isReferer;
  final String? locations;
  final String? resume;
  final String? createdAt;
  final String? updatedAt;

  LoginApiResponse(
      {this.id,
      this.name,
      this.username,
      this.password,
      this.email,
      this.bio,
      this.avatar_url,
      this.html_url,
      this.interests,
      this.isReferer,
      this.locations,
      this.resume,
      this.createdAt,
      this.updatedAt});
}
