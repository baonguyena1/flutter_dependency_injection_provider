import 'package:dependency_injection_provider/locator.dart';
import 'package:dependency_injection_provider/models/comment.dart';
import 'package:dependency_injection_provider/services/api.dart';
import 'package:dependency_injection_provider/utilities/enums/viewstate.dart';

import 'base_model.dart';

class CommentViewModel extends BaseModel {
  Api _api = locator<Api>();

  List<Comment> comments;

  Future fetchComments(int postId) async {
    setState(ViewState.Busy);
    comments = await _api.getCommentForPost(postId);
    setState(ViewState.Idle);
  }

  @override
  void dispose() {
    print('I have been disposed!!');
    super.dispose();
  }
}