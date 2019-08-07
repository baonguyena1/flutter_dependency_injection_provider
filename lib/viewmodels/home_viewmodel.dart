import 'package:dependency_injection_provider/models/post.dart';
import 'package:dependency_injection_provider/services/api.dart';
import 'package:dependency_injection_provider/utilities/enums/viewstate.dart';
import 'package:dependency_injection_provider/viewmodels/base_model.dart';

import '../locator.dart';

class HomeViewModel extends BaseModel {
  Api _api = locator<Api>();

  List<Post> posts;

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    this.posts = await _api.getPostForUser(userId);
    setState(ViewState.Idle);
  }
}