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
      'description': 'Get X,Provider, Bloc, Riverpod',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0X5GQS3MV0lz79Cz1aJn3PqgcoqvWGSk1Isih8pPPn8q31mnQmfk3V1g&s=10',
    },
    {
      'title': 'Flutter Dasar',
      'description': 'Belajar dasar flutter',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVanYlCKHGn5-D9qYNiC7azBvTaHCyCDeV6A5ty8_uMg&s=10',
    },
    {
      'title': 'State Management',
      'description': 'Get X,Provider, Bloc, Riverpod',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgg17gaiTQ1Tgia3ZhzvS9e7DtjHcqvhP2nit2T-R0GNNn2A74U3e2OPHa&s=10',
    },
    {
      'title': 'Flutter Dasar',
      'description': 'Belajar dasar flutter',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpbIZ69JEGsBE-XKCP4-s2kvARbGdJeUOMoggw1N5-vg&s=10',
    },
    {
      'title': 'Kaos Hayato',
      'description': 'Get X,Provider, Bloc, Riverpod',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBBJtRq2TiTdzweNelRe4B1nSpAK45mB1XNf7WSzvEcQ&s=10',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
            margin: const EdgeInsets.all(10),
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 6),
              ],
            ),
            child: Row(
              children: [
                // Image
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(article['image']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Text
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
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
                        ),
                        const SizedBox(height: 5),
                        Text(
                          article['description']!,
                          style: const TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}