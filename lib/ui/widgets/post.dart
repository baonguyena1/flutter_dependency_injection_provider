import 'package:dependency_injection_provider/models/user.dart';
import 'package:dependency_injection_provider/services/api.dart';
import 'package:dependency_injection_provider/ui/widgets/postlist_item.dart';
import 'package:dependency_injection_provider/utilities/constants/route_path.dart';
import 'package:dependency_injection_provider/viewmodels/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_widget.dart';

class Posts extends StatelessWidget {
  const Posts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<PostViewModel>(
        model: PostViewModel(api: Provider.of<Api>(context)),
        onModelReady: (model) => model.getPosts(Provider.of<User>(context).id),
        builder: (context, model, child) => model.busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: model.posts.length,
                itemBuilder: (context, index) => PostListItem(
                      post: model.posts[index],
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RoutePath.Post,
                          arguments: model.posts[index],
                        );
                      },
                    ),
              ));
  }
}