import 'package:flutter/material.dart';
import 'package:pagination_with_bloc/screens/home_Screen.dart';

void main() {
  runApp(const PaginationWithBlocApp());
}
class PaginationWithBlocApp extends StatelessWidget {
  const PaginationWithBlocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}