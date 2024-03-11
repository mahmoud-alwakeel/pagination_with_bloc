class PostsModel {
  final int id;
  final String title;
  final String body;

  const PostsModel({
    required this.id, 
    required this.title, 
    required this.body,
  });

  factory PostsModel.fromJson(map) {
    return PostsModel(
      id: map['id'], 
      title: map['title'], 
      body: map['body'],
    );
  }
}