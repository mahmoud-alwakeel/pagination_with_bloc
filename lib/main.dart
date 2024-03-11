import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_with_bloc/bloc/posts_bloc.dart';
import 'package:pagination_with_bloc/screens/home_Screen.dart';

void main() {
  runApp(const PaginationWithBlocApp());
}

class PaginationWithBlocApp extends StatelessWidget {
  const PaginationWithBlocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsBloc()..add(GetAllPostsEvent()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
