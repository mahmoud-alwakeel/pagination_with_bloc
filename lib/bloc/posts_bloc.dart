import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pagination_with_bloc/models/posts_model.dart';
import 'package:pagination_with_bloc/network/posts_services.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(const PostsState()) {
    on<PostsEvent>((event, emit) async {
      if (event is GetAllPostsEvent) {
        if (state.hasReachedMax) return;
        try {
          if (state.postStatus == PostStatus.loading) {
            final posts = await PostsService().getAllPosts();

            return  posts.isEmpty? 
            emit(state.copyWith(
              postStatus: PostStatus.success,
              hasReachedMax: true,
            )) :
            emit(state.copyWith(
              postStatus: PostStatus.success,
              postsList: posts,
              hasReachedMax: false,
            ));
          } else {
            final posts = await PostsService().getAllPosts(startIndex: state.postsList.length);
            return posts.isEmpty? 
            emit(state.copyWith(hasReachedMax: true)) :
            emit(state.copyWith(
              postStatus: PostStatus.success,
              postsList: List.of(state.postsList)..addAll(posts),
              hasReachedMax: false
            ));
          }
        } catch (e) {
          emit(
            state.copyWith(
              postStatus: PostStatus.failure,
              errorMessage: "failed to load Posts",
            ),
          );
        }
      }
    }, transformer: droppable());
  }
}
