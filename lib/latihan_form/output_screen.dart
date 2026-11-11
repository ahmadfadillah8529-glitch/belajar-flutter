import 'package:flutter/material.dart';

class OutputScreen extends StatelessWidget {
  final String nama, noTelp, email, tglpendaftaran, eskul, kelas;

  const OutputScreen({
    super.key,
    required this.nama,
    required this.noTelp,
    required this.email,
    required this.tglpendaftaran,
    required this.eskul,
    required this.kelas,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Colors.black),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _textWidget("Nama Lengkap", nama),
                _textWidget("Nomer Telepon", noTelp),
                _textWidget("Email", email),
                _textWidget("Tanggal Pendaftaran", tglpendaftaran),
                _textWidget("Eskul", eskul),
                _textWidget("Kelas", kelas),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textWidget(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(": $value")),
        ],
      ),
    );
  }
}