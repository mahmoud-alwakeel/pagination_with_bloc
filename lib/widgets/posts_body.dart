import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_with_bloc/bloc/posts_bloc.dart';
import 'package:pagination_with_bloc/widgets/error.dart';
import 'package:pagination_with_bloc/widgets/loading.dart';
import 'package:pagination_with_bloc/widgets/posts_list.dart';

class PostsBody extends StatelessWidget {
  const PostsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsBloc, PostsState>(
      builder: (context, state) {
     switch (state.postStatus){
      
       case PostStatus.loading:
        return const CustomLoading();
       case PostStatus.success:
        return PostsList(postsList: state.posts);
       case PostStatus.failure:
        return CustomError(message: state.errorMessage);
     }
    });  
}
}