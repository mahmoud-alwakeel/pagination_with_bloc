import 'package:flutter/material.dart';
import 'package:pagination_with_bloc/models/posts_model.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key, required this.postsModel});

  final PostsModel postsModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 22,
        child: Text(postsModel.id.toString()),
      ),
      title: Text(postsModel.title),
      subtitle: Text(postsModel.body),
    );
  }
}