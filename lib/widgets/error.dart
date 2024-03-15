import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_with_bloc/bloc/posts_bloc.dart';

class CustomError extends StatelessWidget {
  const CustomError({super.key, required this.message});

  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<PostsBloc>(context).add(GetAllPostsEvent());
              },
              child: const Text('Try again'))
        ],
      ),
    );
  }
}
