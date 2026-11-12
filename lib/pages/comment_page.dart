import 'package:flutter/material.dart';
import '../models/comment.dart';
import '../services/comment_api.dart';
import 'comment_detail_page.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final ApiService _api = ApiService();
  late Future<List<Comment>> _futureComments;

  @override
  void initState() {
    super.initState();
    _futureComments = _api.fetchComments();
  }

  void _reload() {
    setState(() {
      _futureComments = _api.fetchComments();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Komentar'),
        actions: [
          IconButton(onPressed: _reload, icon: const Icon(Icons.refresh))
        ],
      ),
      body: FutureBuilder<List<Comment>>(
        future: _futureComments,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.wifi_off, size: 48),
                    const SizedBox(height: 12),
                    Text(
                      'Terjadi kesalahan:\n${snapshot.error}',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _reload,
                      child: const Text('Coba Lagi'),
                    ),
                  ],
                ),
              ),
            );
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final comments = snapshot.data!;

          if (comments.isEmpty) {
            return const Center(child: Text('Belum ada data'));
          }

          return ListView.builder(
            itemCount: comments.length,
            itemBuilder: (context, i) {
              final comment = comments[i];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: CircleAvatar(child: Text('${comment.id}')),
                  title: Text(
                    comment.name ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    comment.body ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CommentDetailPage(comment: comment),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}