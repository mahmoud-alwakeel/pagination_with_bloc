import 'package:flutter/material.dart';
import 'package:pagination_with_bloc/widgets/posts_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagination'),
      ),
      body: PostsBody(),
    );
  }
}