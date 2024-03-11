import 'dart:convert';

import 'package:pagination_with_bloc/models/posts_model.dart';
import 'package:http/http.dart' as http;

class PostsService {
  Future<List<PostsModel>> getAllPosts() async {
    const String url = 'https://jsonplaceholder.typicode.com/posts';
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<PostsModel> postsList = [];
      for (var i = 0; i < data.length; i++) {
        postsList.add(PostsModel.fromJson(data[i]));
      }
      return postsList;
    } else {
      throw Exception('Failed to load Posts');
    }
  }
}
