import 'package:dependency_injection_provider/models/user.dart';
import 'package:dependency_injection_provider/ui/widgets/postlist_item.dart';
import 'package:dependency_injection_provider/utilities/constants/route_path.dart';
import 'package:dependency_injection_provider/utilities/enums/viewstate.dart';
import 'package:dependency_injection_provider/viewmodels/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_widget.dart';

class Posts extends StatelessWidget {
  const Posts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModel>(
        onModelReady: (model) => model.getPosts(Provider.of<User>(context).id),
        builder: (context, model, child) => model.state == ViewState.Busy
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
