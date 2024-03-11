part of 'posts_bloc.dart';

enum PostStatus { loading, success, failure }

class PostsState extends Equatable {
  final PostStatus postStatus;
  final List<PostsModel> posts;
  final bool hasReachedMax;
  final String errorMessage;

  const PostsState({
    this.postStatus = PostStatus.loading,
    this.posts = const [],
    this.hasReachedMax = false,
    this.errorMessage = "",
  });

  PostsState copyWith({
    PostStatus? postStatus,
    List<PostsModel>? posts,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return PostsState(
      postStatus: postStatus ?? this.postStatus,
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        postStatus,
        posts,
        hasReachedMax,
        errorMessage,
      ];
}
