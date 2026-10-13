import 'package:flutter/material.dart';
import 'package:flutter_ahmad_12rpl1/latihan_grid_list/detail_screen.dart';

class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({super.key});

  final List<Map<String, String>> articles = const [
    {
      'title': 'Kaos Epep',
      'description': 'Belajar dasar flutter',
      'image': 'https://img.lazcdn.com/g/p/c5acf4647bbe2569a050b51c0ec1484b.jpg_720x720q80.jpg',
    },
    {
      'title': 'State Management',
      'description': 'Get X, Provider, Bloc, Riverpod',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0X5GQS3MV0lz79Cz1aJn3PqgcoqvWGSk1Isih8pPPn8q31mnQmfk3V1g&s=10',
    },
    {
      'title': 'Flutter Dasar',
      'description': 'Belajar dasar flutter',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVanYlCKHGn5-D9qYNiC7azBvTaHCyCDeV6A5ty8_uMg&s=10',
    },
    {
      'title': 'State Management',
      'description': 'Get X, Provider, Bloc, Riverpod',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgg17gaiTQ1Tgia3ZhzvS9e7DtjHcqvhP2nit2T-R0GNNn2A74U3e2OPHa&s=10',
    },
    {
      'title': 'Flutter Dasar',
      'description': 'Belajar dasar flutter',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpbIZ69JEGsBE-XKCP4-s2kvARbGdJeUOMoggw1N5-vg&s=10',
    },
    {
      'title': 'Kaos Hayato',
      'description': 'Get X, Provider, Bloc, Riverpod',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBBJtRq2TiTdzweNelRe4B1nSpAK45mB1XNf7WSzvEcQ&s=10',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListScreen')),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ArticleDetailScreen(data: article),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Gambar di sebelah kiri
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    child: Image.network(
                      article['image']!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      // Biar gak error kalau gambarnya patah/loading
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 100,
                        color: Colors.grey[300],
                        child: const Icon(Icons.broken_image),
                      ),
                    ),
                  ),
                  // Teks di tengah (Expanded biar ngisi sisa space)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            article['title']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            article['description']!,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[600],
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Indikator panah ke kanan biar user tahu ini bisa diklik
                  const Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}