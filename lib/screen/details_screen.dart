import 'package:flutter/material.dart';

import '../common_utils/common_utils.dart';
import '../model/movie_model.dart' as model;

class DetailsScreen extends StatelessWidget {
  final model.Show movie;

  DetailsScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.name ?? '')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NetworkImageWidget(
              imageUrl: movie.image?.original ?? '',
              height: 600,
              width: 600,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                movie.name ?? '',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Text(
                movie.summary ?? 'No summary available',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
