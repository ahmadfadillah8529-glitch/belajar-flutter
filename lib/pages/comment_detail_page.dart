import 'package:flutter/material.dart';
import '../models/comment.dart';

class CommentDetailPage extends StatelessWidget {
  final Comment comment;

  const CommentDetailPage({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Komentar #${comment.id}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              comment.name ?? '',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Email: ${comment.email ?? ''}',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700]),
            ),
            const SizedBox(height: 12),
            Text(comment.body ?? ''),
            const SizedBox(height: 24),
            Text(
              'Post ID: #${comment.postId}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}