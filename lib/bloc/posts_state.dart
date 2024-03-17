part of 'posts_bloc.dart';

enum PostStatus { loading, success, failure }

class PostsState extends Equatable {
  final PostStatus postStatus;
  final List<PostsModel> postsList;
  final bool hasReachedMax;
  final String errorMessage;

  const PostsState({
    this.postStatus = PostStatus.loading,
    this.postsList = const [],
    this.hasReachedMax = false,
    this.errorMessage = "",
  });

  PostsState copyWith({
    PostStatus? postStatus,
    List<PostsModel>? postsList,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return PostsState(
      postStatus: postStatus ?? this.postStatus,
      postsList: postsList ?? this.postsList,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        postStatus,
        postsList,
        hasReachedMax,
        errorMessage,
      ];
}
