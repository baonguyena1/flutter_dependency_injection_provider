import 'package:dependency_injection_provider/models/post.dart';
import 'package:dependency_injection_provider/services/api.dart';
import 'package:dependency_injection_provider/viewmodels/base_model.dart';
import 'package:flutter/foundation.dart';

class PostViewModel extends BaseModel {
  PostViewModel({@required Api api})
    : _api = api;

  Api _api;

  List<Post> posts;

  Future getPosts(int userId) async {
    setBusy(true);
    this.posts = await _api.getPostForUser(userId);
    setBusy(false);
  }
}