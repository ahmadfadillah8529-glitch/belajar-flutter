import 'package:flutter/material.dart';

class GridProductPage extends StatelessWidget {
  const GridProductPage({super.key});

  final List<Map<String, String>> products = const[
    {
      'name' : 'Kaos Epep',
      'price' : 'Rp.120.000',
      'image' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0X5GQS3MV0lz79Cz1aJn3PqgcoqvWGSk1Isih8pPPn8q31mnQmfk3V1g&s=10'
    },
    {
      'name' : 'Kaos Epep',
      'price' : 'Rp.120.000',
      'image' : 'https://img.lazcdn.com/g/p/c5acf4647bbe2569a050b51c0ec1484b.jpg_720x720q80.jpg'
    },
    {
      'name' : 'Celana Epep',
      'price' : 'Rp.120.000',
      'image' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVanYlCKHGn5-D9qYNiC7azBvTaHCyCDeV6A5ty8_uMg&s=10'
    },
    {
      'name' : 'Jaket Epep',
      'price' : 'Rp.120.000',
      'image' : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgg17gaiTQ1Tgia3ZhzvS9e7DtjHcqvhP2nit2T-R0GNNn2A74U3e2OPHa&s=10'
    },
];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing:10,
          mainAxisSpacing:10,
          childAspectRatio:0.8,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[100],
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius:6),
              ],
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(15),
                    child: Image.network(product['image']!, fit: BoxFit.cover,),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  right:10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product['name']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                       Text(
                        product['price']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}