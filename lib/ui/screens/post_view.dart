import 'package:dependency_injection_provider/models/post.dart';
import 'package:dependency_injection_provider/models/user.dart';
import 'package:dependency_injection_provider/shared/text_styles.dart';
import 'package:dependency_injection_provider/shared/ui_helpers.dart';
import 'package:dependency_injection_provider/ui/widgets/comments.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostView extends StatelessWidget {
  final Post post;
  PostView({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UIHelper.verticalSpaceLarge,
            Text(post.title, style: headerStyle),
            Text(
              'by ${Provider.of<User>(context).name}',
              style: TextStyle(fontSize: 9.0),
            ),
            UIHelper.verticalSpaceMedium,
            Text(post.body),
            Comments(post.id),
          ],
        ),
      ),
    );
  }
}
