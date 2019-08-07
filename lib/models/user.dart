import 'package:dependency_injection_provider/models/decode_json.dart';

class User extends DecodeJson {
  int id;
  String name;
  String username;
  User({this.id, this.name, this.username});

  User.initial()
      : id = 0,
        name = '',
        username = '';

  @override
  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    return data;
  }
}
