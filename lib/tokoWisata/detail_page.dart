import 'package:flutter/material.dart';
import 'receipt_page.dart';

class DetailPage extends StatefulWidget {
  final Map<String, dynamic> itemData;
  const DetailPage({Key? key, required this.itemData}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;
  String selectedMethod = 'qris';

  // Fungsi buat nampilin Modal QRIS dengan Barcode & QR Code
  void _showQrisModal(BuildContext context, int totalAmount) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E1E1E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Scan QRIS / Barcode Pembayaran',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              'Total Nominal: Rp $totalAmount',
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Image.network(
                    'https://api.qrserver.com/v1/create-qr-code/?size=140x140&data=FLUTTER-TICKET-QRIS',
                    width: 140,
                    height: 140,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      24,
                      (index) => Container(
                        width: index % 3 == 0 ? 3 : (index % 2 == 0 ? 2 : 4),
                        height: 35,
                        color: Colors.black87,
                        margin: const EdgeInsets.symmetric(horizontal: 1.5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'BARCODE-9821-QRIS-INSTANT',
                    style: TextStyle(fontSize: 10, letterSpacing: 1.5, color: Colors.black54, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                Navigator.pop(ctx);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ReceiptPage(
                      title: widget.itemData['title'],
                      quantity: quantity,
                      total: totalAmount,
                      method: 'QRIS Instant',
                    ),
                  ),
                );
              },
              child: const Text('Simulasi Bayar Berhasil', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }

  // Fungsi validasi Cash / Tunai dengan Input Dialog
  void _showCashInputModal(BuildContext context, int totalAmount) {
    final TextEditingController cashController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF1E1E1E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Masukkan Nominal Uang Tunai', style: TextStyle(color: Colors.white, fontSize: 16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total Tagihan: Rp $totalAmount', style: const TextStyle(color: Colors.grey, fontSize: 13)),
            const SizedBox(height: 12),
            TextField(
              controller: cashController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Contoh: 100000',
                hintStyle: const TextStyle(color: Colors.white30),
                filled: true,
                fillColor: Colors.black26,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF5722)),
            onPressed: () {
              final int? paidAmount = int.tryParse(cashController.text);
              if (paidAmount == null || paidAmount < totalAmount) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Uang tunai kurang atau tidak valid! Harap masukkan sesuai tagihan.'),
                    backgroundColor: Colors.redAccent,
                  ),
                );
              } else {
                int change = paidAmount - totalAmount;
                Navigator.pop(ctx);
                
                if (change > 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Pembayaran diterima. Uang kembalian Anda: Rp $change'),
                      backgroundColor: Colors.green,
                      duration: const Duration(seconds: 3),
                    ),
                  );
                }

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ReceiptPage(
                      title: widget.itemData['title'],
                      quantity: quantity,
                      total: totalAmount,
                      method: 'Cash / Tunai (Bayar di Loket)',
                    ),
                  ),
                );
              }
            },
            child: const Text('Konfirmasi Bayar', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final int price = widget.itemData['price'];
    final int totalAmount = price * quantity;
    
    // Deteksi layar buat nerapin responsif ukuran desktop vs hp
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 768;

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: isDesktop ? 1100 : double.infinity),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image Banner
                      Stack(
                        children: [
                          Image.network(
                            widget.itemData['image'], 
                            height: isDesktop ? 340 : 280, 
                            width: double.infinity, 
                            fit: BoxFit.cover,
                          ),
                          SafeArea(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.black45,
                                    child: IconButton(
                                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  ),
                                  const CircleAvatar(
                                    backgroundColor: Colors.black45,
                                    child: Icon(Icons.bookmark_border, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),

                      // Detail Body
                      Padding(
                        padding: EdgeInsets.all(isDesktop ? 32.0 : 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.itemData['title'], 
                              style: TextStyle(fontSize: isDesktop ? 26 : 22, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            const SizedBox(height: 4),
                            Text(widget.itemData['location'], style: const TextStyle(color: Colors.grey, fontSize: 13)),
                            const SizedBox(height: 16),
                            const Text('Deskripsi Wisata', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white)),
                            const SizedBox(height: 6),
                            Text(widget.itemData['description'], style: const TextStyle(color: Colors.white70, fontSize: 13, height: 1.5)),
                            const SizedBox(height: 20),

                            // Quantity Counter
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Jumlah Tiket', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white)),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () { if (quantity > 1) setState(() => quantity--); },
                                      icon: const Icon(Icons.remove_circle_outline, color: Colors.white70),
                                    ),
                                    Text('$quantity', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
                                    IconButton(
                                      onPressed: () { setState(() => quantity++); },
                                      icon: const Icon(Icons.add_circle, color: Color(0xFFFF5722)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const Divider(height: 32, color: Colors.white10),

                            // Payment Methods
                            const Text('Pilih Metode Pembayaran', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white)),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => setState(() => selectedMethod = 'qris'),
                                    child: Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: selectedMethod == 'qris' ? const Color(0xFFFF5722) : Colors.white10,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                        color: selectedMethod == 'qris' ? const Color(0xFF1E1E1E) : const Color(0xFF161616),
                                      ),
                                      child: Column(
                                        children: const [
                                          Icon(Icons.qr_code_2, color: Color(0xFFFF5722)),
                                          SizedBox(height: 4),
                                          Text('QRIS Instant', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => setState(() => selectedMethod = 'cash'),
                                    child: Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: selectedMethod == 'cash' ? const Color(0xFFFF5722) : Colors.white10,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                        color: selectedMethod == 'cash' ? const Color(0xFF1E1E1E) : const Color(0xFF161616),
                                      ),
                                      child: Column(
                                        children: const [
                                          Icon(Icons.payments, color: Colors.grey),
                                          SizedBox(height: 4),
                                          Text('Cash (Loket)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Action Bottom Bar
              Container(
                padding: EdgeInsets.all(isDesktop ? 24 : 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A1A),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 10)],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Total Bayar', style: TextStyle(color: Colors.grey, fontSize: 11)),
                        Text('Rp $totalAmount', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFFFF5722))),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF5722),
                        padding: EdgeInsets.symmetric(horizontal: isDesktop ? 36 : 28, vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      ),
                      onPressed: () {
                        if (selectedMethod == 'qris') {
                          _showQrisModal(context, totalAmount);
                        } else {
                          _showCashInputModal(context, totalAmount);
                        }
                      },
                      child: const Text('Bayar Sekarang', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}