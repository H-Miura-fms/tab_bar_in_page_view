import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final num index;
  const DetailScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("$index"),
    );
  }
}
