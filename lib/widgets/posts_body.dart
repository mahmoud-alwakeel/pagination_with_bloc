import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_with_bloc/bloc/posts_bloc.dart';
import 'package:pagination_with_bloc/widgets/error.dart';
import 'package:pagination_with_bloc/widgets/loading.dart';
import 'package:pagination_with_bloc/widgets/post_item.dart';

class PostsBody extends StatefulWidget {
  const PostsBody({super.key});

  @override
  State<PostsBody> createState() => _PostsBodyState();
}

class _PostsBodyState extends State<PostsBody> {
  final scrollController = ScrollController();

  void onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScrollPosition = scrollController.offset;

    if (currentScrollPosition >= (maxScroll * 0.9)) {
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
    scrollController
      ..removeListener(onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsBloc, PostsState>(builder: (context, state) {
      switch (state.postStatus) {
        case PostStatus.loading:
          return const CustomLoading();
        case PostStatus.success:
          return ListView.builder(
              controller: scrollController,
              itemCount: state.hasReachedMax? state.postsList.length : state.postsList.length + 1,
              itemBuilder: (context, index) {
                return index >= state.postsList.length ? 
                const Center(child: CircularProgressIndicator(),) :
                 PostListItem(postsModel: state.postsList[index]);
              });
        case PostStatus.failure:
          return CustomError(message: state.errorMessage);
      }
    });
  }
}
