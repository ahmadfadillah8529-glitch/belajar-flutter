import 'package:flutter/material.dart';
import 'detail_page.dart';

class TiketHome extends StatelessWidget {
  const TiketHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Data list langsung tanpa class model
    final List<Map<String, dynamic>> items = [
      {
        'id': 'borobudur',
        'title': 'Candi Borobudur',
        'location': 'Magelang, Jawa Tengah',
        'price': 50000,
        'image': 'https://images.unsplash.com/photo-1596402184320-417e7178b2cd?auto=format&fit=crop&q=80&w=600',
        'description': 'Candi Buddha terbesar di dunia yang dibangun pada abad ke-9 dengan arsitektur menakjubkan.',
      },
      {
        'id': 'labuan-bajo',
        'title': 'Labuan Bajo & Komodo',
        'location': 'Nusa Tenggara Timur',
        'price': 150000,
        'image': 'https://images.unsplash.com/photo-1518548419970-58e3b4079ab2?auto=format&fit=crop&q=80&w=600',
        'description': 'Jelajahi keindahan perbukitan pulau Padar, hewan langka Komodo, dan laut Pink Beach.',
      },
      {
        'id': 'taman-safari',
        'title': 'Taman Safari Bogor',
        'location': 'Bogor, Jawa Barat',
        'price': 230000,
        'image': 'https://images.unsplash.com/photo-1534567153574-2b12153a87f0?auto=format&fit=crop&q=80&w=600',
        'description': 'Taman rekreasi keluarga berwawasan lingkungan dan alam bebas tempat perlindungan satwa.',
      },
    ];

    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 768;

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Center(
          // Kalau di desktop lebarnya fleksibel max 1200px, kalau HP full width
          child: Container(
            constraints: BoxConstraints(maxWidth: isDesktop ? 1100 : double.infinity),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(isDesktop ? 32.0 : 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // User Greeting Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 22,
                            backgroundImage: NetworkImage('https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150'),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Halo, Petualang!', style: TextStyle(color: Colors.grey, fontSize: 12)),
                              Text('Sarah Wijaya 👋', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.notifications_none_rounded, color: Colors.white70),
                        onPressed: () {},
                      )
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Title Headline
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: isDesktop ? 32 : 24, fontWeight: FontWeight.bold, color: Colors.white),
                      children: const [
                        TextSpan(text: 'Jelajahi Surga\n'),
                        TextSpan(text: 'Wisata Indonesia', style: TextStyle(color: Color(0xFFFF5722))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Search Bar
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Cari tempat wisata...',
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      suffixIcon: Container(
                        margin: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF5722),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.tune, color: Colors.white, size: 18),
                      ),
                      filled: true,
                      fillColor: const Color(0xFF1E1E1E),
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Featured Card
                  const Text('Rekomendasi Utama', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(itemData: items[0])));
                    },
                    child: Container(
                      height: isDesktop ? 260 : 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        image: DecorationImage(image: NetworkImage(items[0]['image']), fit: BoxFit.cover),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 16,
                            left: 16,
                            right: 16,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(items[0]['title'], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: isDesktop ? 22 : 18)),
                                    Text(items[0]['location'], style: const TextStyle(color: Colors.white70, fontSize: 12)),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                                  child: Text('Rp ${items[0]['price']}', style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFF5722))),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Grid Destinasi Populer (Otomatis menyesuaikan jumlah kolom berdasarkan device)
                  const Text('Destinasi Populer', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
                  const SizedBox(height: 12),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: items.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isDesktop ? 3 : 2, // HP = 2 kolom, Komputer/Tablet = 3 kolom biar rapi melebar
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.85,
                    ),
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage(itemData: item))),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1E1E1E),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.white10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(item['image'], width: double.infinity, fit: BoxFit.cover),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(item['title'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white), maxLines: 1, overflow: TextOverflow.ellipsis),
                              Text(item['location'], style: const TextStyle(color: Colors.grey, fontSize: 10)),
                              const SizedBox(height: 6),
                              Text('Rp ${item['price']}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white70)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}