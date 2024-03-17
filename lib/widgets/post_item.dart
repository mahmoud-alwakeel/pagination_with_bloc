import 'package:flutter/material.dart';
import 'package:pagination_with_bloc/models/posts_model.dart';


class PostListItem extends StatelessWidget {
  const PostListItem({super.key, required this.postsModel});

  final PostsModel postsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.deepPurple[200],
          child: Text(postsModel.id.toString())),
        title: Text(postsModel.title),
        isThreeLine: true,
        subtitle: Text(postsModel.body),
      ),
    );
  }
}