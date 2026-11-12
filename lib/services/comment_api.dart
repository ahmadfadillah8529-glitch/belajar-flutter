import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/api_constants.dart';
import '../models/comment.dart';

class ApiService {
  Future<List<Comment>> fetchComments() async {
    final url = Uri.parse(
      '${ApiConstants.baseUrl}${ApiCommets.commentsEndpoint}'
    );

    try{
      //1) Minta Data (maksimal tunggu 10 detik)
      final response = await http.get(url).timeout(const Duration(seconds: 10));

      //2) cek apakah berhasil (200=OK)
      if (response.statusCode == 200) {
        //3)Ubah teks JSON menjadi list
        final List data = jsonDecode(response.body);

        //4)Bungkus tiap item menjadi obejk Comment
        return data.map((e) => Comment.fromJson(e)).toList();
      }else {
        throw Exception('Gagal memuat data (kode: ${response.statusCode})');
      }
    }on TimeoutException {
      throw Exception('Koneksi terlalu lama. Coba Lagi!');
    }
  }
}