import 'package:flutter/material.dart';
import 'home_page.dart';

class ReceiptPage extends StatelessWidget {
  final String title;
  final int quantity;
  final int total;
  final String method;

  const ReceiptPage({
    Key? key,
    required this.title,
    required this.quantity,
    required this.total,
    required this.method,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Deteksi ukuran layar untuk responsif desktop vs HP
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 768;

    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Tema Dark Mode Konsisten
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: isDesktop ? 600 : double.infinity),
            child: Padding(
              padding: EdgeInsets.all(isDesktop ? 32.0 : 24.0),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Icon(Icons.check_circle, size: 64, color: Colors.green),
                  const SizedBox(height: 8),
                  const Text('Pembayaran Berhasil!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  const Text('E-Tiket resmi Anda telah dibuat', style: TextStyle(color: Colors.grey, fontSize: 12)),
                  const SizedBox(height: 20),

                  // Card Ticket Struk (Responsive Expanded/Scrollable if needed)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E1E1E),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: Colors.white10),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 15)],
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: const BoxDecoration(
                                color: Color(0xFF161616),
                                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(color: Colors.green.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
                                    child: const Text('LUNAS', style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold, fontSize: 10)),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  _buildDetailRow('Nama Pemesan', 'Sarah Wijaya'),
                                  _buildDetailRow('Metode Bayar', method),
                                  _buildDetailRow('Jumlah Tiket', '$quantity Orang'),
                                  _buildDetailRow('ID Transaksi', '#WNDR-883921'),
                                  const Divider(height: 24, color: Colors.white10),
                                  _buildDetailRow('Total Pembayaran', 'Rp $total', isTotal: true),
                                  const SizedBox(height: 20),

                                  // Barcode Digital Placeholder (Disesuaikan tema gelap)
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(12)),
                                    child: Column(
                                      children: const [
                                        Icon(Icons.line_weight, size: 48, color: Colors.white70),
                                        SizedBox(height: 4),
                                        Text('9928 - 3819 - 8820 - 1102', style: TextStyle(fontSize: 10, letterSpacing: 2, color: Colors.grey)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF5722),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const TiketHome()),
                        (route) => false,
                      );
                    },
                    child: const Text('Kembali ke Beranda', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: isTotal ? Colors.white : Colors.grey, fontSize: isTotal ? 14 : 12, fontWeight: isTotal ? FontWeight.bold : FontWeight.normal)),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: isTotal ? 16 : 12, color: isTotal ? const Color(0xFFFF5722) : Colors.white70)),
        ],
      ),
    );
  }
}