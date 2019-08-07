import 'dart:convert';
import 'package:dependency_injection_provider/models/comment.dart';
import 'package:dependency_injection_provider/models/user.dart';
import 'package:dependency_injection_provider/models/post.dart';
import 'package:http/http.dart' as http;

// class Parser {
//   T decode<T extends DecodeJson>(T object,String body) {
//     final data = json.decode(body);
//     T result = object
//                 ..fromJson(data);
//     return result;
//   }

//   List<T> decodeArray<T extends DecodeJson>(T object,String body) {
//     final data = json.decode(body) as List<dynamic>;
//     List<T> result = data.map((json) => object.fromJson(json)).toList();
//     return result;
//   }
// }

class Api {
  static const endpoint = 'https://jsonplaceholder.typicode.com';

  var client = http.Client();

  Future<User> getUserProfile(int userId) async {
    var response = await client.get('$endpoint/users/$userId');
    return User.fromJson(json.decode(response.body));
  }

  Future<List<Post>> getPostForUser(int userId) async {
    var response = await client.get('$endpoint/posts?userId=$userId');
    final parsed = json.decode(response.body) as List<dynamic>;
    return parsed.map((data) => Post.fromJson(data)).toList();
  }

  Future<List<Comment>> getCommentForPost(int postId) async {
    var response = await client.get('$endpoint/comments?postId=$postId');
    final parsed = json.decode(response.body) as List<dynamic>;
    return parsed.map((data) => Comment.fromJson(data)).toList();
  }
}