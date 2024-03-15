import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_with_bloc/bloc/posts_bloc.dart';
import 'package:pagination_with_bloc/models/posts_model.dart';
import 'package:pagination_with_bloc/widgets/post_item.dart';

class PostsList extends StatefulWidget {
  const PostsList({super.key, required this.postsList});
  final List<PostsModel> postsList;

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  final scrollController = ScrollController();

  void onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScrollPosition = scrollController.offset;

    if (currentScrollPosition >= maxScroll * 0.9) {
      context.read<PostsBloc>().add(GetAllPostsEvent());
    } 
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(onScroll);
  }

  @override
  void dispose() {
    scrollController..removeListener(onScroll)..dispose();
        super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: widget.postsList.length,
      itemBuilder: (context, index) {
        return PostItem(postsModel: widget.postsList[index]);
      });
  }
}