import 'package:dependency_injection_provider/models/comment.dart';
import 'package:dependency_injection_provider/services/api.dart';
import 'package:flutter/foundation.dart';

import 'base_model.dart';

class CommentsViewModel extends BaseModel {
  Api _api;

  CommentsViewModel({
    @required Api api,
  }) : _api = api;

  List<Comment> comments;

  Future fetchComments(int postId) async {
    setBusy(true);
    comments = await _api.getCommentForPost(postId);
    setBusy(false);
  }

  @override
  void dispose() {
    print('I have been disposed!!');
    super.dispose();
  }
}